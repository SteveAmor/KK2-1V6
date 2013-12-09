
ShowVersion:
	call LcdClear
	
	lrv PixelType, 1
	lrv FontSelector, f6x8

	lrv X1, 0
	lrv Y1, 10
	mPrintString sho1

	lrv X1, 0
	lrv Y1, 19
	mPrintString sho2

	lrv X1, 0
	lrv Y1, 29
	mPrintString sho3

	call LcdUpdate

	ldx 1000
	call WaitXms

	ret

	


sho1:   .db "HW Ver 2.1 ",0
sho2:	.db "FW Ver 1.6 ",0
sho3:	.db " hexTronik ",0
