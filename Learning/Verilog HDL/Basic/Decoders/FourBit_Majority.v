//German E Felisarta III	16101002	Group 3 M 07:30 AM - 10:30 AM

module FourBit_Majority(X, Y, C_i, Sum, C_o); //A, B, C_in, S, C_out

	input    [3:0]X;
	input    [3:0]Y;
	input       C_i;
	output [3:0]Sum;
	output      C_o;
	wire NW0, NW1, NW2, NW3;//not gate wires
	wire CW0, CW1, CW2;		//carry out only 2 
									//because there is one C_out already
	
	not N0(NW0, Y[0]);
	not N1(NW1, Y[1]);
	not N2(NW2, Y[2]);
	not N3(NW3, Y[3]);
	
	FullAdder FA1 (X[0], NW0, C_i, Sum[0], CW0);
	FullAdder FA2 (X[1], NW1, CW0, Sum[1], CW1);
	FullAdder FA3 (X[2], NW2, CW1, Sum[2], CW2);
	FullAdder FA4 (X[3], NW3, CW2, Sum[3], C_o);
	

endmodule




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
	