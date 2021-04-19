//German E Felisarta III	16101002	Group 3 M 07:30 AM - 10:30 AM

module FullAdder(A, B, C_in, S, C_out);

	input A, B, C_in;
	output S, C_out;
	wire W1;				// S Wires
	wire W2, W3, W4;		// C_out Wires
	
	
	//S Function
	xor X1 (W1, A, B);
	xor X2 (S, C_in, W1);
	
	//C_out Function
	and A1 (W2, B, C_in);
	and A2 (W3, A, C_in);
	and A3 (W4, A, B);
	
	//joining gates for C_out
	or (C_out, W2, W3, W4);
	
	
	
endmodule


/*

FULL ADDER FUNCTIONS

S = C_in XOR (A XOR B)
C_out = BC_in + AC_in + AB


*/
	