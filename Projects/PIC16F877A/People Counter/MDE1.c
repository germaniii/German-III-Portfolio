//FELISARTA, German III E 16101002
//Grp 1 CpE3201
//MDE#1

#include<xc.h>         // include file for the XC8 compiler  

//FUNCTION PROTOYPES
void delay(int cnt);
void instCtrl(unsigned char INST);
void initLCD();
void dataCtrl(unsigned char DATA);
void printDetails();
void interrupt ISR();

//GLOBAL FLAGS
bit count_flag = 0;

//counter
char counter = 0;

//reset switch
char resetswitch = 0;

//1 minute timer variables
char minTimer = 0;
bit ppm_calc = 0;
int min_val = 0;
float ppm_val = 0;
int rounded_ppm_val = 0;
char ppm_val_tenths =0;
char ppm_val_ones =0;
char ppm_val_tens =0;


void main(){
	//PORT DIRECTIONS
	ADCON1 = 0x06;  
	TRISA = 0x00;
	TRISB = 0xFF;
	TRISC = 0xFF;
	TRISD = 0x00;
	initLCD();

	//RB0 INT INITIALIZATION
	INTEDG = 1;	//RB0/INT
	INTE = 1;
	INTF = 0;
	OPTION_REG = 0x44;
	T0IE = 1;	//Timer0 INT
	T0IF = 0;
	GIE = 1;
	printDetails();

	//Capture INT INITIALIZATION
	T1CON = 0x30; // 1:8 prescaler, internal clock, Timer1 off
	TMR1IE = 1; // enable Timer1 overflow interrupt (PIE1 reg)
	TMR1IF = 0; // reset interrupt flag (PIR1 reg)
	PEIE = 1; // enable all peripheral interrupt (INTCON reg)
	GIE = 1; // enable all unmasked interrupts (INTCON reg)
	TMR1 = 0x0BDC; // counter starts counting at 0x0BDC (3036)
	TMR1ON = 1; // Turns on Timer1 (T1CON reg)

	while(1){
	
		// PEOPLE COUNTER PRINTER
		instCtrl(0x87);
		if (counter<10){									// Print 1 place value
			dataCtrl((0x3 << 4) | counter);	
			dataCtrl(' ');
			dataCtrl(' ');
		}else if (counter < 99){							// Print 2 places value
			char hi = counter/10;
			char lo = counter - ((counter/10)*10);
			dataCtrl((0x3 << 4) | hi);
			dataCtrl((0x3 << 4) | lo);
			dataCtrl(' ');
		}else{												// Print 100
			dataCtrl('1');
			dataCtrl('0');
			dataCtrl('0');
		}
			
		//PEOPLE PER MINUTE PRINTER
		instCtrl(0xD8);
		if (min_val == 0){									// if less than a minute, just print the value of counter
			if (counter<10){
				dataCtrl('0');
				dataCtrl((0x3 << 4) | counter);
				dataCtrl('.');
				dataCtrl('0');
			}else if (counter < 99){
				char hi = counter/10;
				char lo = counter - ((counter/10)*10);
				dataCtrl((0x3 << 4) | hi);
				dataCtrl((0x3 << 4) | lo);
				dataCtrl('.');
				dataCtrl('0');
			}else{
				dataCtrl('1');
				dataCtrl('0');
				dataCtrl('0');
				dataCtrl('.');
				dataCtrl('0');
			}
		}else{												//if minute is >= 1min, calculate the people per minute

			/*OPERATIONS*/
			ppm_val = (float) counter/min_val;
			rounded_ppm_val = (int)(ppm_val * 10);
			ppm_val_tens = (char) (rounded_ppm_val/100);
			ppm_val_ones = (char) ppm_val_tens * -100;
			ppm_val_ones += (char) rounded_ppm_val;
			ppm_val_ones /= (char) 10;
			ppm_val_tenths =  (char) ppm_val_tens * -100;
			ppm_val_tenths += (char) ppm_val_ones * -10;
			ppm_val_tenths += (char) rounded_ppm_val;
			ppm_val_tenths /= (char) 1;
			
			/*PRINT VALUE*/
			dataCtrl((0x3 << 4) | ppm_val_tens);
			dataCtrl((0x3 << 4) | ppm_val_ones);
			dataCtrl('.');
			dataCtrl((0x3 << 4) | ppm_val_tenths);

		}	
	}
	
}

// INTERRUPT FUNCTION
void interrupt ISR(){		
	GIE = 0;

	if(INTF){		 							// if RB0 Interrupt

		INTF = 0;
		if(RB4){ 								// INCREMENT
			if (counter < 100)
				counter++;
	
		}else if(RB5){ 							// RESET
			TMR1H = 0x00;
			TMR1L = 0x00;
				if(resetswitch == 0)
					resetswitch++;
				else{							// Reset counter and minute timer if resetswitch is set
					resetswitch = 0;
					counter = 0;
					min_val = 0;
				}
		}
		
	
	}else if(T0IF){								

		T0IF = 0;
		count_flag = 1;
		
	}else if(TMR1IF==1){ 						// checks Timer1 interrupt flag
		
		TMR1IF = 0; 							// clears interrupt flag
		TMR1 = 0x0BDC; 							// timer will start counting at 0x0BDC (3036)

		resetswitch=0;							// if user cannot press within 50ms, resetswitch to 0 to prevent reset
		
		if(minTimer == 120){					// checks if minuteTimer is equal to 120(60seconds)
			minTimer = 0;						// if equal, increments the min_val (minute variable)
			min_val++;
		}else{
			minTimer++;							// if not equal, increments the minTimer variable
		}

	}


	GIE = 1;
}

//DELAY FUNCTION
void delay(int cnt){

	int i, j;
	for(i = cnt; i != 0; i--) // loop until i = 0
	for(j = 0; j<10000; j++);

}

//LCD FUNCTIONS
void instCtrl(unsigned char INST){

	PORTD = INST; // load instruct to PORTB
	RA0 = 0; // RS to 0
	RA2 = 0; // RW to 0
	RA1 = 1; // E to 1
	delay(1);
	RA1 = 0; // E to 0

}

void dataCtrl(unsigned char DATA){

	PORTD = DATA; // load data to PORTB
	RA0 = 1;  // RS to 1
	RA2 = 0; // RW to 0
	RA1 = 1; // E to 1
	delay(1);
	RA1 = 0; // E to 0

}

void initLCD(){
	
	delay(1);
	instCtrl(0x38); // Set Function to 8bits interface 2 line display
	instCtrl(0x01); // Display Clear
	instCtrl(0x06); // Entry mode set
	instCtrl(0x0E); // Display ON, Cursor On, Blink oFF

}

void printDetails(){
	instCtrl(0x80);
	dataCtrl('P');
	dataCtrl('E');
	dataCtrl('O');
	dataCtrl('P');
	dataCtrl('L');
	dataCtrl('E');
	dataCtrl(':');
	dataCtrl(' ');
	
	instCtrl(0xD4);
	dataCtrl('P');
	dataCtrl('P');
	dataCtrl('M');
	dataCtrl(':');
	dataCtrl(' ');

}


