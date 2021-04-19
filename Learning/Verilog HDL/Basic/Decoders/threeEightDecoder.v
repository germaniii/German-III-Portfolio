//GERMAN E FELISARTA III	16101002	CpE3101L GRP3

module threeEightDecoder(X,En,O);
	
	input  [2:0]X;
	input       En;
	output [1:0]O;
	wire   W1, W2;
	
	and A5(W1, X[2], En);
	and A6(W2, X[2], En);
	//twoFourDecoder tFD1 (X[2], 0, En, W1);
	//twoFourDecoder tFD2 (X[2], 0, En, W2);
	twoFourDecoder tFD3 (X[0], X[2], W1, O[1]);
	twoFourDecoder tFD4 (X[1], X[2], W2, O[0]);


endmodule

module twoFourDecoder(A1, A2, E, D); //A,E,D
	input  A1, A2, E;
	output [3:0]D;
	
	and And1(D[0], A1, A2, E);
	and And2(D[1], A1, A2, E);
	and And3(D[2], A1, A2, E);
	and And4(D[3], A1, A2, E);
	
endmodule
