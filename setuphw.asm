
SetupHardware:
	;       76543210	;set port directions
//	ldi t,0b00000000
	ldi t,0b00110010	// output5, output6
	out ddra,t
	
	;       76543210
	ldi t,0b00001010
	out ddrb,t
	
	;       76543210
//	ldi t,0b11111111
	ldi t,0b11111100	// scl, sda, output 1-8
	out ddrc,t

	;       76543210
	ldi t,0b11110010
	out ddrd,t


	;       76543210
	ldi t,0b11111111	;turn off digital inputs on port A
	store didr0,t

	;       76543210
	ldi t,0b11110101	;turn on pull ups on button inputs and aux, rud
	out portb,t

	ldi t,0b00000011	;turn on pull ups SPI pin
	out portc,t         //***

	;       76543210
	ldi t,0b00001101	;turn on pull ups on thr, ele and ail
	out portd ,t

	;       76543210
	ldi t,0b00000000	;Set timer 1 to run at 2.5MHz
	store tccr1a, t

	;       76543210
	ldi t,0b00000010	
	store tccr1b, t

	;       76543210
	ldi t,0b00000000	
	store tccr1c, t


	;       76543210
	ldi t,0b00010101	;setup external interrupts.
	store eicra, t

	;       76543210
	ldi t,0b00000111
	store eimsk, t

	;       76543210
	ldi t,0b00001010
	store pcicr, t

	;       76543210
	ldi t,0b00000001
	store pcmsk3, t

	;       76543210
	ldi t,0b00000001
	store pcmsk1, t


;sbi OutputPin8   ;<---- OBS

// Init_TWI =============================
	//SPI SETTING   //void TWI_Master_Initialise(void)
	lds	t,TWSR
	andi t,0b11111100		// initialize twi prescaler and bit rate SET TO 1
	sts TWSR,t

	ldi	t, 18   //set brud rate	 18 = 400k, 72 = 125k, 92 = 100K clk rate
	sts TWBR, t
    // TWBR = ((20000000L / 100000L) - 16) / 2 // bitrate register
    // enable twi module, acks, and twi interrupt

	ldi t,(1<<TWEN)// | (1<<TWIE)|(1<<TWEA)
	sts TWCR, t

     /* TWEN - TWI Enable Bit
        TWIE - TWI Interrupt Enable
        TWEA - TWI Enable Acknowledge Bit
        TWINT - TWI Interrupt Flag
        TWSTA - TWI Start Condition
     */
	
	call	setup_mpu6050

//	read and check correct setup 
	call	MPU_setup

	;--- setup LCD --- 

	sbi lcd_cs1		;LCD signals
	sbi lcd_scl
	cbi lcd_res

	LedOn			;I am alive
	BuzzerOn
	ldx 500
	call WaitXms
	LedOff
	BuzzerOff

	sbi lcd_res

	ldx 100
	call WaitXms

	

	;---

	ret

BaudRatedelay:

	ldi t,231		;this delay may need tweaking to give errorfree transfer
ba1:	dec t
	brne ba1
	ret

