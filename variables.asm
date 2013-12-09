;--- RAM ---

.equ	LcdBuffer	=0x0100 ;to 0x04ff  Screen buffer, 1024 bytes

.equ	RamMixerTable	=0x0500 ;to 0x053f  SRAM copy of mixer table

.set	RamVariables	=0x0540 ;to 0x07ff  SRAM variables

				;0x0800-0x08ff Stack





;--- EEPROM ---

			;0x0000  to 0x0003  Signature 

.equ	EeMixerTable	=0x0004 ;to 0x0043  Mixer Table, 8bit, 64 bytes

.equ	EeParameterTable=0x0044 ;to 0x005c  Axis gain and limit parameters, 16bit, 24 bytes

.equ	EeSensorCalData	=0x005d ;to 0x006f  Sensor calibration data, 16.8bit, 18 bytes

.set	EeRegisters	=0x0070 ;to

        

;---  16.8 bit signed registers ---

FixedPointVariableEnumerate168 Temp
FixedPointVariableEnumerate168 RxChannel
FixedPointVariableEnumerate168 RxRoll
FixedPointVariableEnumerate168 RxPitch
FixedPointVariableEnumerate168 RxThrottle
FixedPointVariableEnumerate168 RxYaw
FixedPointVariableEnumerate168 RxAux

FixedPointVariableEnumerate168 GyroRoll
FixedPointVariableEnumerate168 GyroPitch
FixedPointVariableEnumerate168 GyroYaw
FixedPointVariableEnumerate168 GyroRollZero
FixedPointVariableEnumerate168 GyroPitchZero
FixedPointVariableEnumerate168 GyroYawZero
FixedPointVariableEnumerate168 GyroRollVC
FixedPointVariableEnumerate168 GyroPitchVC

FixedPointVariableEnumerate168 AccX
FixedPointVariableEnumerate168 AccY
FixedPointVariableEnumerate168 AccZ
FixedPointVariableEnumerate168 AccXZero
FixedPointVariableEnumerate168 AccYZero
FixedPointVariableEnumerate168 AccZZero

FixedPointVariableEnumerate168 BatteryVoltage
FixedPointVariableEnumerate168 BatteryVoltageLowpass

FixedPointVariableEnumerate168 CommandRoll		;output from IMU
FixedPointVariableEnumerate168 CommandPitch
FixedPointVariableEnumerate168 CommandYaw

FixedPointVariableEnumerate168 IntegralRoll	;PI control
FixedPointVariableEnumerate168 IntegralPitch
FixedPointVariableEnumerate168 IntegralYaw
FixedPointVariableEnumerate168 Error
FixedPointVariableEnumerate168 PgainRoll
FixedPointVariableEnumerate168 PgainPitch
FixedPointVariableEnumerate168 PgainYaw
FixedPointVariableEnumerate168 PlimitRoll
FixedPointVariableEnumerate168 PlimitPitch
FixedPointVariableEnumerate168 PlimitYaw
FixedPointVariableEnumerate168 IgainRoll
FixedPointVariableEnumerate168 IgainPitch
FixedPointVariableEnumerate168 IgainYaw
FixedPointVariableEnumerate168 IlimitRoll
FixedPointVariableEnumerate168 IlimitPitch
FixedPointVariableEnumerate168 IlimitYaw

FixedPointVariableEnumerate168 EscLowLimit

FixedPointVariableEnumerate168 StickScaleRoll
FixedPointVariableEnumerate168 StickScalePitch
FixedPointVariableEnumerate168 StickScaleYaw
FixedPointVariableEnumerate168 StickScaleThrottle

FixedPointVariableEnumerate168 Mixvalue

FixedPointVariableEnumerate168 Out1
FixedPointVariableEnumerate168 Out2
FixedPointVariableEnumerate168 Out3
FixedPointVariableEnumerate168 Out4
FixedPointVariableEnumerate168 Out5
FixedPointVariableEnumerate168 Out6
FixedPointVariableEnumerate168 Out7
FixedPointVariableEnumerate168 Out8

FixedPointVariableEnumerate168 FilteredOut1
FixedPointVariableEnumerate168 FilteredOut2
FixedPointVariableEnumerate168 FilteredOut3
FixedPointVariableEnumerate168 FilteredOut4
FixedPointVariableEnumerate168 FilteredOut5
FixedPointVariableEnumerate168 FilteredOut6
FixedPointVariableEnumerate168 FilteredOut7
FixedPointVariableEnumerate168 FilteredOut8

FixedPointVariableEnumerate168 Offset1
FixedPointVariableEnumerate168 Offset2
FixedPointVariableEnumerate168 Offset3
FixedPointVariableEnumerate168 Offset4
FixedPointVariableEnumerate168 Offset5
FixedPointVariableEnumerate168 Offset6
FixedPointVariableEnumerate168 Offset7
FixedPointVariableEnumerate168 Offset8

FixedPointVariableEnumerate168 Temper

FixedPointVariableEnumerate168 SelflevelPgain
FixedPointVariableEnumerate168 SelflevelPlimit

FixedPointVariableEnumerate168 HeightDampeningGain
FixedPointVariableEnumerate168 HeightDampeningLimit

FixedPointVariableEnumerate168 BattAlarmVoltage

FixedPointVariableEnumerate168 AccAngleRoll
FixedPointVariableEnumerate168 AccAnglePitch

;FixedPointVariableEnumerate168 Debug6
;FixedPointVariableEnumerate168 Debug5
;FixedPointVariableEnumerate168 Debug7
;FixedPointVariableEnumerate168 Debug8

FixedPointVariableEnumerate168 LimitV
FixedPointVariableEnumerate168 Value

FixedPointVariableEnumerate168 LvaDdsAcc

FixedPointVariableEnumerate168 PwmOutput

FixedPointVariableEnumerate168 ServoFilter

FixedPointVariableEnumerate168 ArmedBeepDds

FixedPointVariableEnumerate168 BeeperDelay

FixedPointVariableEnumerate168 AccTrimRoll
FixedPointVariableEnumerate168 AccTrimPitch

FixedPointVariableEnumerate168 AutoDisarmDelay

FixedPointVariableEnumerate168 CheckRxDelay

FixedPointVariableEnumerate168 NoActivityTimer
FixedPointVariableEnumerate168 NoActivityDds

FixedPointVariableEnumerate168 LiveUpdateTimer

FixedPointVariableEnumerate168 EulerAngleRoll
FixedPointVariableEnumerate168 EulerAnglePitch

FixedPointVariableEnumerate168 Angle

FixedPointVariableEnumerate168 AccXfilter
FixedPointVariableEnumerate168 AccYfilter
FixedPointVariableEnumerate168 AccZfilter

FixedPointVariableEnumerate168 CamRollGain
FixedPointVariableEnumerate168 CamRollOffset
FixedPointVariableEnumerate168 CamPitchGain
FixedPointVariableEnumerate168 CamPitchOffset
FixedPointVariableEnumerate168 CamRoll
FixedPointVariableEnumerate168 CamPitch

FixedPointVariableEnumerate824 Theta
FixedPointVariableEnumerate824 Sine
FixedPointVariableEnumerate824 Cosine

FixedPointVariableEnumerate824 VectorX
FixedPointVariableEnumerate824 VectorY
FixedPointVariableEnumerate824 VectorZ
FixedPointVariableEnumerate824 LengthVector

FixedPointVariableEnumerate824 VectorA
FixedPointVariableEnumerate824 VectorB

FixedPointVariableEnumerate824 TempA
FixedPointVariableEnumerate824 TempB
FixedPointVariableEnumerate824 TempC
FixedPointVariableEnumerate824 TempD


FixedPointVariableEnumerate824 VectorNewA
FixedPointVariableEnumerate824 VectorNewB

FixedPointVariableEnumerate824 Debug


;--- RAM variables (8bit)----

RamVariableEnumerate8 Xpos		;pixel pos
RamVariableEnumerate8 Ypos

RamVariableEnumerate8 X1		;line start and end
RamVariableEnumerate8 Y1
RamVariableEnumerate8 X2
RamVariableEnumerate8 Y2

RamVariableEnumerate8 PixelType		;0 = EOR   1 = OR   2 = AND

RamVariableEnumerate8 FontSelector

RamVariableEnumerate8 MainMenuCursorYposSave
RamVariableEnumerate8 MainMenuListYposSave

RamVariableEnumerate8 LoadMenuCursorYposSave
RamVariableEnumerate8 LoadMenuListYposSave

RamVariableEnumerate8 RollStartL		;used in readrx.asm
RamVariableEnumerate8 RollStartH

RamVariableEnumerate8 PitchStartL
RamVariableEnumerate8 PitchStartH

RamVariableEnumerate8 ThrottleStartL
RamVariableEnumerate8 ThrottleStartH

RamVariableEnumerate8 YawStartL
RamVariableEnumerate8 YawStartH

RamVariableEnumerate8 AuxStartL
RamVariableEnumerate8 AuxStartH


RamVariableEnumerate8 RollL		;output from readrx.asm
RamVariableEnumerate8 RollH

RamVariableEnumerate8 PitchL
RamVariableEnumerate8 PitchH

RamVariableEnumerate8 ThrottleL
RamVariableEnumerate8 ThrottleH

RamVariableEnumerate8 YawL
RamVariableEnumerate8 YawH

RamVariableEnumerate8 AuxL
RamVariableEnumerate8 AuxH

RamVariableEnumerate8 RollDcnt
RamVariableEnumerate8 PitchDcnt
RamVariableEnumerate8 ThrottleDcnt
RamVariableEnumerate8 YawDcnt
RamVariableEnumerate8 AuxDcnt

RamVariableEnumerate8 flagRollValid
RamVariableEnumerate8 flagPitchValid
RamVariableEnumerate8 flagThrottleValid
RamVariableEnumerate8 flagYawValid
RamVariableEnumerate8 flagAuxValid

RamVariableEnumerate8 RxTimeoutLimit

RamVariableEnumerate8 OutputRateBitmask	;for each output channel: 0=slow rate  1=fast rate
RamVariableEnumerate8 OutputTypeBitmask	;for each output channel: 0=servo 1=ESC
RamVariableEnumerate8 OutputRateDivider	;
RamVariableEnumerate8 OutputRateDividerCounter

RamVariableEnumerate8 flagRollPitchLink

RamVariableEnumerate8 flagPwmEnd

RamVariableEnumerate8 flagArmed
RamVariableEnumerate8 flagArmedOldState
RamVariableEnumerate8 flagThrottleZero
RamVariableEnumerate8 ArmingDelay

RamVariableEnumerate8 TimeStampL		;for debug purposes
RamVariableEnumerate8 TimeStampH

RamVariableEnumerate8 flagLcdUpdate

RamVariableEnumerate8 flagSelfLevelType
RamVariableEnumerate8 flagSelfLevelOn
RamVariableEnumerate8 flagStickCommandSelfLevelOn

RamVariableEnumerate8 flagAuxOn
RamVariableEnumerate8 flagAuxOnOldState

RamVariableEnumerate8 ButtonDelay

RamVariableEnumerate8 flagSensorsOk

RamVariableEnumerate8 flagA
RamVariableEnumerate8 flagB
RamVariableEnumerate8 flagC

RamVariableEnumerate8 Index

RamVariableEnumerate8 OutputTypeBitmaskCopy

RamVariableEnumerate8 flagInactive

RamVariableEnumerate8 flagLvaBuzzerOn

RamVariableEnumerate8 flagGeneralBuzzerOn

RamVariableEnumerate8 Status
RamVariableEnumerate8 StatusOldState

RamVariableEnumerate8 flagAutoDisarm

RamVariableEnumerate8 flagMutePwm

RamVariableEnumerate8 flagCppmOn

RamVariableEnumerate8 flagDebugBuzzerOn

RamVariableEnumerate8 flagGyrosCalibrated


RamVariableEnumerate8 CppmPulseStartL
RamVariableEnumerate8 CppmPulseStartH

RamVariableEnumerate8 CppmPulseArrayAddressL
RamVariableEnumerate8 CppmPulseArrayAddressH

RamVariableEnumerate8 CppmChannel1L
RamVariableEnumerate8 CppmChannel1H
RamVariableEnumerate8 CppmChannel2L
RamVariableEnumerate8 CppmChannel2H
RamVariableEnumerate8 CppmChannel3L
RamVariableEnumerate8 CppmChannel3H
RamVariableEnumerate8 CppmChannel4L
RamVariableEnumerate8 CppmChannel4H
RamVariableEnumerate8 CppmChannel5L
RamVariableEnumerate8 CppmChannel5H
RamVariableEnumerate8 CppmChannel6L
RamVariableEnumerate8 CppmChannel6H
RamVariableEnumerate8 CppmChannel7L
RamVariableEnumerate8 CppmChannel7H
RamVariableEnumerate8 CppmChannel8L
RamVariableEnumerate8 CppmChannel8H
RamVariableEnumerate8 CppmChannel9L
RamVariableEnumerate8 CppmChannel9H


RamVariableEnumerate8 CppmTimeoutCounter


;--- EEPROM registers ----

EEVariableEnumerate16 eeLcdContrast

EEVariableEnumerate16 eeSelflevelPgain		;do not change the order of these variables, works as an array
EEVariableEnumerate16 eeSelflevelPlimit
EEVariableEnumerate16 eeAccTrimRoll
EEVariableEnumerate16 eeAccTrimPitch

EEVariableEnumerate16 eeEscLowLimit		;do not change the order of these variables, works as an array
EEVariableEnumerate16 eeHeightDampeningGain
EEVariableEnumerate16 eeHeightDampeningLimit
EEVariableEnumerate16 eeBattAlarmVoltage
EEVariableEnumerate16 eeServoFilter

EEVariableEnumerate16 eeStickScaleRoll		;do not change the order of these variables, works as an array
EEVariableEnumerate16 eeStickScalePitch
EEVariableEnumerate16 eeStickScaleYaw
EEVariableEnumerate16 eeStickScaleThrottle

EEVariableEnumerate8 eeCppmRoll			;do not change the order of these variables, works as an array
EEVariableEnumerate8 eeCppmPitch
EEVariableEnumerate8 eeCppmThrottle
EEVariableEnumerate8 eeCppmYaw
EEVariableEnumerate8 eeCppmAux

EEVariableEnumerate8 eeSelfLevelType		;true=Stick command  false=Aux    ;do not change the order of these variables, works as an array
EEVariableEnumerate8 eeLinkRollPitch		;true=on  false=off 
EEVariableEnumerate8 eeAutoDisarm		;true=on  false=off
EEVariableEnumerate8 eeCppmOn			;true=on  false=off

EEVariableEnumerate16 eeCamRollGain		;do not change the order of these variables, works as an array
EEVariableEnumerate16 eeCamRollOffset
EEVariableEnumerate16 eeCamPitchGain
EEVariableEnumerate16 eeCamPitchOffset

EEVariableEnumerate8 eeSensorsCalibrated	





;--- Registers (global) ----

					;r0-r1 used by the HW multiplier

					;r2-r13 part of the local variables pool

.def	treg			=r14	;temp reg for ISR

.def	SregSaver		=r15	;Storage of the SREG, used in ISR

.def	t			=r16	;Main temporary register

					;R17-R24 is the local variables pool

.def	tt			=r25	;Temp reg for ISR

