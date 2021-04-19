;GERMAN E FELISARTA III 16101002   CpE3104 Grp 1  

LIST P=16F84A, F=INHX8M	 	 	 ; MCU is PIC16F84A, output is Intel Hex
INCLUDE<P16F84A.INC>	 	 	 ; include this file to use register names instead of addresses
__CONFIG _CP_OFF & _WDT_ON & _XT_OSC ; code protection off, Watchdog Timer on, XTAL osc used
	 	 
      ; user-defined register declaration and memory assignment
      COUNT EQU 0CH	 	 	 	 ; assign COUNT to memory address 0CH
	
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
      MOVLW 0AH	 	 	 	 	 ; load literal value 0AH to Wreg
      MOVWF COUNT	 	 	 	 ; move data in Wreg to register COUNT 

HERE 
     MOVLW 09H					 ; SETS PORTB to 9
     MOVWF PORTB					
COUNTDOWN					 ; Countdown loop from 9-0
     SLEEP	 	 	 	 	 ; put CPU to sleep (acts as delay)
	 	 	 	 	 	 ; WDT will wake up CPU at certain time interval
     DECFSZ COUNT, 1		 	 	 ; decrement register COUNT, skip next line if result is 0
     GOTO INC	 	 	 	 	 ; jump to label INC
     GOTO START	 	 	 	 	 ; jump to label START
      
INC  DECF PORTB	 	 	 	 	 ; increment register PORTB
     GOTO COUNTDOWN	 	 	 	 	 ; jump to label HERE

END	 	 	 	 	 ; end of program
