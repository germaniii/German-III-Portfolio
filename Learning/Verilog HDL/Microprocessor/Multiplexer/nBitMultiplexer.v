//GERMAN E FELISARTA III 16101002	CpE3101L Group 3

module nBitMultiplexer(A, B, C, D, S, Y);
	
	localparam n = 8;	
	
		input [n-1:0]A;
		input [n-1:0]B;
		input [n-1:0]C;
		input [n-1:0]D;
		input [1:0]S;
		output [n-1:0]Y;
	
	assign Y = (S == 2'b00) ? A : ( (S == 2'b01) ? B : ( (S == 2'b10) ? C : ( (S == 2'b11) ? D : 0) ) );
	
endmodule
