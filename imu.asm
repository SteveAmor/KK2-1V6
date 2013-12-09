
Imu:	;--- Get Sensor Data ---

	call AdcRead					;Calculate gyro output
	b16sub GyroRoll, GyroRoll, GyroRollZero
	b16sub GyroPitch, GyroPitch, GyroPitchZero
	b16sub GyroYaw, GyroYaw, GyroYawZero

	b16sub AccX, AccX, AccXZero			;remove offset from Acc
	b16sub AccY, AccY, AccYZero
	b16sub AccZ, AccZ, AccZZero		

	b16add AccX, AccX, AccTrimPitch			;add trim
	b16add AccY, AccY, AccTrimRoll


	b16ldi Temper, 0.03				;SF LP filter the accerellometers

	b16sub Error, AccX, AccXfilter
	b16mul Error, Error, Temper
	b16add AccXfilter, AccXfilter, Error

	b16sub Error, AccY, AccYfilter
	b16mul Error, Error, Temper
	b16add AccYfilter, AccYfilter, Error

	b16sub Error, AccZ, AccZfilter
	b16mul Error, Error, Temper
	b16add AccZfilter, AccZfilter, Error


	;---  calculate tilt angle with the acc. (this approximation is good to about 20 degrees) --

	b16ldi Temp, 0.7
	b16mul AccAngleRoll, AccYfilter, Temp
	b16mul AccAnglePitch, AccXfilter, Temp


	;--- Add correction data to gyro inputs based on difference between Euler angles and acc angles ---

	b16mov GyroRollVC, GyroRoll			;fork gyrovalues to be used in 3D vector calc.
	b16mov GyroPitchVC, GyroPitch

	b16ldi Temp, 20					;skip correction at angles greater than +-20
	b16cmp AccAnglePitch, Temp
	longbrge im40
	b16cmp AccAngleRoll, Temp
	longbrge im40

	b16neg Temp
	b16cmp AccAnglePitch, Temp
	longbrlt im40
	b16cmp AccAngleRoll, Temp
	longbrlt im40

	b16ldi Temp, 60					;skip correction if vertical accelleration is outside 0.5 to 1.5 G
	b16cmp AccZfilter, Temp
	longbrge im40

	b16neg Temp
	b16cmp AccZfilter, Temp
	longbrlt im40
	 
	b16sub Temp, EulerAngleRoll, AccAngleRoll	;add roll correction
	b16fdiv Temp, 2
	b16add GyroRollVC, GyroRollVC, Temp

	b16sub Temp, EulerAnglePitch, AccAnglePitch	;add pitch correction
	b16fdiv Temp, 2
	b16add GyroPitchVC, GyroPitchVC, Temp

	;rvsetflagtrue flagDebugBuzzerOn
	rjmp im41

im40:	;rvsetflagfalse flagDebugBuzzerOn

im41:

	;--- Rotate up-direction 3D vector with gyro inputs ---

	call Rotate3dVector

	call Lenght3dVector
	
	call ExtractEulerAngles

	;--debug
/*
	b824load vectorX
	call transfer824168
	b16store debug5
	b16ldi Temp, 2220
	b16mul debug5, debug5, Temp

	b824load vectorY
	call transfer824168
	b16store debug6
	b16ldi Temp, 2220
	b16mul debug6, debug6, Temp

	b824load vectorZ
	call transfer824168
	b16store debug7
	b16ldi Temp, 2220
	b16mul debug7, debug7, Temp
*/



	;--- Calculate Stick and Gyro  ---

	rvbrflagfalse flagThrottleZero, im7	;reset integrals if throttle closed 
	b16clr IntegralRoll
	b16clr IntegralPitch
	b16clr IntegralYaw

im7:	b16fdiv RxRoll, 4			;Right align to the 16.4 multiply usable bit limit.
	b16fdiv RxPitch, 4
	b16fdiv RxYaw, 4

	b16mul RxRoll, RxRoll, StickScaleRoll	;scale Stick input. 
	b16mul RxPitch, RxPitch, StickScalePitch
	b16mul RxYaw, RxYaw, StickScaleYaw
	b16mul RxThrottle, RxThrottle, StickScaleThrottle


	;----- Self level ----

	rvbrflagtrue flagSelflevelOn, im31	;skip if false
	rjmp im30	

im31:	

;--- Roll Axis Self-level P ---

	b16neg RxRoll
	
	b16fdiv RxRoll, 1

	b16sub Error, EulerAngleRoll, RxRoll	;calculate error
	b16fdiv Error, 4

	b16mul Value, Error, SelflevelPgain	;Proposjonal gain

	b16mov LimitV, SelflevelPlimit		;Proposjonal limit
	rcall limiter
	b16mov RxRoll, Value

	b16fdiv RxRoll, 1


;--- Pitch Axis Self-level P ---

	b16neg RxPitch
	
	b16fdiv RxPitch, 1

	b16sub Error, EulerAnglePitch, RxPitch	;calculate error
	b16fdiv Error, 4

	b16mul Value, Error, SelflevelPgain	;Proposjonal gain

	b16mov LimitV, SelflevelPlimit		;Proposjonal limit
	rcall limiter
	b16mov RxPitch, Value

	b16fdiv RxPitch, 1
im30:


;--- Roll Axis PI ---
	
	b16sub Error, GyroRoll, RxRoll		;calculate error
	b16fdiv Error, 1

	b16mul Value, Error, PgainRoll		;Proposjonal gain

	b16mov LimitV, PlimitRoll		;Proposjonal limit
	rcall limiter
	b16mov CommandRoll, Value

	b16fdiv Error, 3
	b16mul Temp, Error, IgainRoll		;Integral gain
	b16add Value, IntegralRoll, Temp

	b16mov LimitV, IlimitRoll 		;Integral limit
	rcall limiter
	b16mov IntegralRoll, Value

	b16add CommandRoll, CommandRoll, IntegralRoll


;--- Pitch Axis PI ---

	b16sub Error, RxPitch, GyroPitch	;calculate error
	b16fdiv Error, 1

	b16mul Value, Error, PgainPitch		;Proposjonal gain

	b16mov LimitV, PlimitPitch		;Proposjonal limit
	rcall limiter
	b16mov CommandPitch, Value

	b16fdiv Error, 3
	b16mul Temp, Error, IgainPitch		;Integral gain
	b16add Value, IntegralPitch, Temp

	b16mov LimitV, IlimitPitch 		;Integral limit
	rcall limiter
	b16mov IntegralPitch, Value

	b16add CommandPitch, CommandPitch, IntegralPitch


;--- Yaw Axis PI ---

	b16sub Error, RxYaw, GyroYaw		;calculate error
	b16fdiv Error, 1

	b16mul Value, Error, PgainYaw		;Proposjonal gain

	b16mov LimitV, PlimitYaw		;Proposjonal limit
	rcall limiter
	b16mov CommandYaw, Value

	b16fdiv Error, 3
	b16mul Temp, Error, IgainYaw		;Integral gain
	b16add Value, IntegralYaw, Temp

	b16mov LimitV, IlimitYaw 		;Integral limit
	rcall limiter
	b16mov IntegralYaw, Value

	b16add CommandYaw, CommandYaw, IntegralYaw


;------
	ret



limiter:
	b16cmp Value, LimitV	;high limit
	brlt lim5
	b16mov Value, LimitV

lim5:	b16neg LimitV		;low limit
	b16cmp Value, LimitV
	brge lim6
	b16mov Value, LimitV

lim6:	ret








/*

	b16mov LimitV, 
	b16mov Value, 
	rcall limiter
	b16mov , Value

*/
