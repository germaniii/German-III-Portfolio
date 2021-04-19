//German E Felisarta III	16101002	Group 3 M 07:30 AM - 10:30 AM

module Adder_4Bit(X, Y, CIn, SUM, COut);

	input 		 [3:0]X;
	input 		 [3:0]Y;
	input				 CIn;
	output 	  [3:0]SUM;
	output 			COut;
	wire 		W1, W2, W3;
	
	FullAdder FA1 (X[0], Y[0], CIn, SUM[0], W1);
	FullAdder FA2 (X[1], Y[1], W1, SUM[1], W2);
	FullAdder FA3 (X[2], Y[2], W2, SUM[2], W3);
	FullAdder FA4 (X[3], Y[3], W3, SUM[3], COut);
	
	
endmodule


module FullAdder(A, B, C_in, S, C_out);

	input A, B, C_in;
	output S, C_out;
	wire W1, W2, W3, W4;
	
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
	