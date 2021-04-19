//GERMAN E FELISARTA III 16101002	CpE3101L	GRP3

`timescale 1 ns / 1 ps
module tb_threeEightDecoder();

	//all inputs are reg 	input  [2:0]X, En;
	reg [2:0]X;
	reg     En;
	//all outputs are wire. output [1:0]O;
	wire [1:0]O;
	
	//instantiate UUT
	threeEightDecoder UUT (X, En, O);
	
	//generate stimuli
	initial
		begin 
			X[0] = 0; X[1] = 0; X[2] = 0; En = 0; #10
			X[0] = 0; X[1] = 0; X[2] = 0; En = 1; #10
			X[0] = 0; X[1] = 0; X[2] = 1; En = 0; #10
			X[0] = 0; X[1] = 0; X[2] = 1; En = 1; #10
			X[0] = 0; X[1] = 1; X[2] = 0; En = 0; #10
			X[0] = 0; X[1] = 1; X[2] = 0; En = 1; #10
			X[0] = 0; X[1] = 1; X[2] = 1; En = 0; #10
			X[0] = 0; X[1] = 1; X[2] = 1; En = 1; #10
			X[0] = 1; X[1] = 0; X[2] = 0; En = 0; #10
			X[0] = 1; X[1] = 0; X[2] = 0; En = 1; #10
			X[0] = 1; X[1] = 0; X[2] = 1; En = 0; #10
			X[0] = 1; X[1] = 0; X[2] = 1; En = 1; #10
			X[0] = 1; X[1] = 1; X[2] = 0; En = 0; #10
			X[0] = 1; X[1] = 1; X[2] = 0; En = 1; #10
			X[0] = 1; X[1] = 1; X[2] = 1; En = 0; #10
			X[0] = 1; X[1] = 1; X[2] = 1; En = 1; #10
			
			$stop;
		end
		
endmodule
 