//German E Felisarta III	16101002	Group 3 M 07:30 AM - 10:30 AM

`timescale 1 ns / 1 ps
module tb_FourBit_Majority();

	//All inputs reg  A, B, C_in, 
	reg [3:0]X;
	reg [3:0]Y;
	reg    C_i;	
	
	//all outputs wire S, C_out
	wire [3:0]Sum;
	wire      C_o;
	
	//instatntiate UUT
	FourBit_Majority UUT (X, Y, C_i, Sum, C_o);
	
	//generate stimuli
	initial
		begin
			X = 4'b1010; Y = 4'b0101; C_i = 1; #10
			X = 4'b1111; Y = 4'b0101; C_i = 1; #10
			X = 4'b1110; Y = 4'b0101; C_i = 1; #10
			X = 4'b1011; Y = 4'b0101; C_i = 1; #10
			X = 4'b1010; Y = 4'b0101; C_i = 1; #10
			X = 4'b1000; Y = 4'b0101; C_i = 1; #10
			X = 4'b0111; Y = 4'b0101; C_i = 1; #10
			X = 4'b0110; Y = 4'b0101; C_i = 1; #10
			X = 4'b1010; Y = 4'b0011; C_i = 1; #10
			X = 4'b1010; Y = 4'b0011; C_i = 1; #10
			X = 4'b1010; Y = 4'b0011; C_i = 1; #10
			X = 4'b1010; Y = 4'b0011; C_i = 1; #10
			X = 4'b1010; Y = 4'b0001; C_i = 1; #10
			X = 4'b1010; Y = 4'b0001; C_i = 1; #10
			X = 4'b1010; Y = 4'b0001; C_i = 1; #10
			X = 4'b1010; Y = 4'b0001; C_i = 1; #10
			
			$stop;
		end
		
endmodule
			