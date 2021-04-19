//GERMAN E FELISARTA III 		16101002 	Grp 3 3101L

module twoFourDecoder(A, E, D);
	input [1:0]A;
	input E;
	output[3:0]D;
	
	and A1(D[0], A[0], A[1], E);
	and A2(D[1], A[0], A[1], E);
	and A3(D[2], A[0], A[1], E);
	and A4(D[3], A[0], A[1], E);
	
endmodule

	