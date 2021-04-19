//German E Felisarta III	16101002	CpE 3101L Group 3

module threeBitEvenParityGenerator(A, E, P);
		
		input [2:0]A;
		input E;
		output P;
		
		assign P = (E) ? ((A[0] ^ A[1] ^ A[2]) ? 1 : 0) : 1'bz;
		
endmodule
	