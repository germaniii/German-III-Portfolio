//GERMAN E FELISARTA III 16101002	Grp 3 3101L

`timescale 1 ns / 1 ps
module tb_twoFourDecoder();

	//all inputs to reg
	reg [1:0]A;
	reg E;
	
	//all outputs wire
	wire [3:0]D;
	
	//instantiate UUT
	twoFourDecoder UUT (A, E, D);
	
	//generate stimuli
	initial
		begin
			E = 0; A[0] = 0; A[1] = 0; #10
			E = 1; A[0] = 0; A[1] = 0; #10
			E = 1; A[0] = 0; A[1] = 1; #10
			E = 1; A[0] = 1; A[1] = 0; #10
			E = 1; A[0] = 1; A[1] = 1; #10
			
			$stop;
		end
endmodule

