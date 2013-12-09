

UpdateFlightDisplay:

	rvsetflagtrue flagMutePwm

	call LcdClear

	lrv PixelType, 1
	lrv FontSelector, f12x16


	;--- print armed status ---

	rvbrflagfalse flagArmed, udp3

	lrv X1, 34				;Armed
	lrv Y1, 22
	mPrintString upd5

	rjmp udp22

udp3:	lrv X1, 38				;Safe
	lrv Y1, 0

;	rjmp imudebug				;enable this line for IMU debug screen

	mPrintString upd2

udp22:

	;--- Print footer if safe ---

	rvbrflagtrue flagArmed, udp20


	lrv X1, 0				;footer
	lrv Y1, 57
	lrv FontSelector, f6x8
	mPrintString upd1
udp20:


	rvbrflagfalse flagArmed, udp23		;skip the rest if armed
	rjmp udp21
udp23:	


	;--- print Selflevel status ---

	lrv X1, 0
	lrv Y1, 17
	lrv FontSelector, f6x8
	mPrintString udp9

	rvbrflagtrue flagSelfLevelOn, udp12
	mPrintString udp11
	rjmp udp13
udp12:	mPrintString udp10
udp13:	

	;--- Print status ----

	lrv X1, 0
	lrv Y1, 27

	ldz udp24*2
	lds t, status
	lsl t
	add zl, t
	clr t
	adc zh, t

	lpm xl, z+
	lpm xh, z
	
	movw z, x
	
	call PrintString
	 

	;--- Print battery voltage


	b16ldi Temp, 6.875067139
	b16mul Temp, BatteryVoltage, Temp
	b16fdiv Temp, 8

	lrv X1, 0
	lrv Y1, 36
	lrv FontSelector, f6x8
	mPrintString udp30

	b16load Temp
 	call Print16Signed 
	
	ldi t,'.'
	call PrintChar

	mov xl, yh
	clr xh
	b16store Temp

	b16ldi Temper, 0.0390625
	b16mul Temp, Temp, Temper

	b16load Temp
 	call Print16Signed 

	mPrintString udp31


	lrv X1, 0			;show Euler angles
	lrv Y1, 45
	mPrintString udp18
	b16load EulerAngleRoll
	rvbrflagfalse flagGyrosCalibrated, udp40
 	call Print16Signed 
udp40:
	lrv X1, 0
	lrv Y1, 54
	mPrintString udp19
	b16load EulerAnglePitch
	rvbrflagfalse flagGyrosCalibrated, udp41
 	call Print16Signed 
udp41:

udp21:	call LcdUpdate

	rvsetflagfalse flagMutePwm

	ret


upd1:	.db "                 MENU",0
upd2:	.db 64,58,61,60, 0, 0		;the text "SAFE" in the mangled 12x16 font
upd5:	.db 58,63,62,60,59, 0		;the text "ARMED" in the mangled 12x16 font


udp9:	.db "Self-level is ",0,0
udp10:	.db "ON",0,0
udp11:	.db "OFF",0

udp30:	.db "Battery: ",0
udp31:	.db " V",0,0


udp18:	.db " Roll Angle:", 0, 0
udp19:	.db "Pitch Angle:", 0, 0




sta0:	.db "OK.",0
sta1:	.db "ACC not calibrated.  ",0
sta2:	.db "Error: no Roll input.",0
sta3:	.db "Error: no Pitch input",0
sta4:	.db "Error: no Thro input.",0
sta5:	.db "Error: no Yaw input. ",0
sta6:	.db "Error: no AUX input. ",0
sta7:	.db "Error: Sanity check. ",0



udp24:	.dw sta0*2, sta1*2, sta2*2, sta3*2, sta4*2, sta5*2, sta6*2, sta7*2


/*

	;--- 3D vector debug code, show vector and angles

imudebug:

	lrv PixelType, 1
	lrv FontSelector, f6x8

	lrv X1, 0
	lrv Y1, 0
	b824load VectorX
	call b824print

	rvadd X1, 8
	b824load VectorY
	call b824print

	lrv X1, 0
	lrv Y1, 8
	b824load VectorZ
	call b824print

	rvadd X1, 8
	b824load LengthVector
	call b824print


	lrv X1, 0
	lrv Y1, 20
	b16load gyroRoll
	clr yl 
	call b824print
	
	lrv X1, 64
	lrv Y1, 20
	b16load EulerAngleRoll
	clr yl 
	call b824print




	lrv X1, 0
	lrv Y1, 45
	mPrintString udp18
	b16load EulerAngleRoll
 	call Print16Signed 


	lrv X1, 0
	lrv Y1, 54
	mPrintString udp19
	b16load EulerAnglePitch
 	call Print16Signed 


	lrv X1, 100
	lrv Y1, 45
	b16load AccAngleRoll
 	call Print16Signed 


	lrv X1, 100
	lrv Y1, 54
	b16load AccAnglePitch
 	call Print16Signed 





	rjmp udp21




	;---- end of debug code

*/

