/*	
	FILE:				tb_Adder_4Bit.v
	AUTHOR:			German E Felisarta III
	CLASS:			CpE 3101L
	GROUP/SCHED:	M 7:30 - 10:30 AM
	DESC:				Testbench file for Adder_4Bit.v
	
*/
`timescale 1 ns /  1 ps
module tb_Adder_4Bit();

	//all inputs to UUT are declared as reg type
	reg [3:0] A, B;
	reg		 C_in;
	
	//all outputs from UUT are declared as wire type
	wire [3:0] S;
	wire 	 C_out;
	
	//instantiate UUT with explicit mapping
	Adder_4Bit UUT (A, B, C_in, S, C_out);
	
	//generate stimuli
	initial
	begin
		A = 4'd0; 	B = 4'd0; 	C_in = 0; #10
		A = 4'd3; 	B = 4'd8; 	C_in = 1; #10
		A = 4'd11; 	B = 4'd3; 	C_in = 0; #10
		A = 4'd12; 	B = 4'd6; 	C_in = 0; #10
		A = 4'd5; 	B = 4'd4; 	C_in = 1; #10
		A = 4'd1; 	B = 4'd9; 	C_in = 0; #10
		A = 4'd15; 	B = 4'd15; 	C_in = 0; #10
		A = 4'd15; 	B = 4'd15; 	C_in = 1; #10
		
			$stop;
	end
endmodule
