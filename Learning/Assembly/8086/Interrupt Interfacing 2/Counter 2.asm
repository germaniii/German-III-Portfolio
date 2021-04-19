;GERMAN E FELISARTA III 16101002   CpE3104 Grp 1  

      LIST P=16F84A, F=INHX8M	 	 	 ; MCU is PIC16F84A, output is Intel Hex
      INCLUDE<P16F84A.INC>	 	 	 ; include this file to use register names instead of addresses
      __CONFIG _CP_OFF & _WDT_ON & _XT_OSC ; code protection off, Watchdog Timer on, XTAL osc used
	 	 
      ; user-defined register declaration and memory assignment
	
      ; initialize PIC
      BSF STATUS, RP0	 	 	 	 ; set register bank to 1
      CLRF TRISB	 	 	 	 ; clear register TRISB (bank 1)
	 	 	 	 	 	 ; sets all bits in PORTB as "output"
      MOVLW 0DH	 	 	 	 	 ; load literal value 0DH to Wreg
						 ; prescaler 1:64 assigned to Watchdog Timer (WDT)
      MOVWF OPTION_REG	 	 	 	 ; move data in Wreg to register OPTION_REG (bank 0/1)
      BCF STATUS, RP0	 	 	 	 ; set register bank to 0
      
	 	 ; program start
START CLRF PORTB	 	 	 	 ; clear register PORTB (bank 0)
      MOVLW 03FH				 ; SETS PORTB to 0
      MOVWF PORTB

HERE BTFSS PORTA, 0	 	 	 	 ; check if RB0 (PORTB) if equal to 1, if true skip next line
     GOTO HERE	 	 	 		 ; jump to label HERE
		 	 	 	 	 ; wait for button press 
     GOTO COUNTDOWN

COUNTDOWN					 ; Countdown loop from 9-0
     SLEEP	 	 	 	 	 ; put CPU to sleep (acts as delay)
	 	 	 	 	 	 ; WDT will wake up CPU at certain time interval
     
     MOVLW 06FH				 	; SETS PORTB to 9
     MOVWF PORTB
     SLEEP
     
     MOVLW 07FH				 	; SETS PORTB to 8
     MOVWF PORTB
     SLEEP
     
     MOVLW 007H				 	; SETS PORTB to 7
     MOVWF PORTB
     SLEEP
     
     MOVLW 07DH				 	; SETS PORTB to 6
     MOVWF PORTB
     SLEEP
     
     MOVLW 06DH				 	; SETS PORTB to 5
     MOVWF PORTB
     SLEEP
     
     MOVLW 066H				 	; SETS PORTB to 4
     MOVWF PORTB
     SLEEP
     
     MOVLW 04FH				 	; SETS PORTB to 3
     MOVWF PORTB
     SLEEP
     
     MOVLW 05BH				 	; SETS PORTB to 2
     MOVWF PORTB
     SLEEP
     
     MOVLW 006H					; SETS PORTB to 1
     MOVWF PORTB
     SLEEP
     
     MOVLW 03FH				 	; SETS PORTB to 0
     MOVWF PORTB
     SLEEP
     
     GOTO HERE					 ; Restart cycle
     END	 	 	 	 	 ; end of program
