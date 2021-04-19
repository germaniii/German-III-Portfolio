//GERMAN E FELISARTA III 	16101002	CpE3101L Group 3

module Exercise4A(R, A, B);
		input [3:0]A;
		input [3:0]B;
		output [2:0]R;
		
		assign R[0] = (A < B) ? 1 :  0;
		assign R[1] = (A == B) ? 1 :  0;
		assign R[2] = (A > B) ? 1 :  0;
		
endmodule
