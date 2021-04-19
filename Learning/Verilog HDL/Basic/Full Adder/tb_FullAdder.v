/*
	FILE:				tb_FullAdder.v
	AUTHOR:			German E Felisarta III
	CLASS:			CpE 3101L
	GROUP/SCHED:	GROUP#3, M 07:30 AM - 10:30 AM
	DESCRIPTION:	Testbench file for FullAdder.v
	
*/

`timescale 1 ns / 1 ps
module tb_FullAdder();

	//all inputs to UUT are declared as reg type
	reg A, B, C_in;
	//all outputs from UUT are declares as wire type
	
	//instantiate UUT with implicit port mapping
	FullAdder UUT (A, B, C_in, S, C_out);
	
	//generate stimuli
	initial
	begin
		A = 0; B = 0; C_in = 0; #10
		A = 0; B = 0; C_in = 1; #10
		A = 0; B = 1; C_in = 0; #10
		A = 0; B = 1; C_in = 1; #10
		A = 1; B = 0; C_in = 0; #10
		A = 1; B = 0; C_in = 1; #10
		A = 1; B = 1; C_in = 0; #10
		A = 1; B = 1; C_in = 1; #30
		
			$stop;
	end
	
endmodule
 