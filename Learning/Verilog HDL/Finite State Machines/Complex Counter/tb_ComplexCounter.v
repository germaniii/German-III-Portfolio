//German E Felisarta III 16101002 CpE 3101L Grp 3

`timescale 1 ns / 1 ps
module tb_ComplexCounter ();

	reg CLOCK, nReset, M;
	wire [2:0]COUNT;
	
	ComplexCounter UUT (CLOCK, nReset, M, COUNT);
	
	initial CLOCK = 1'b0;
	
	always #5 CLOCK = ~CLOCK;
	
	initial begin
		
		nReset = 1'b0; #20
		nReset = 1'b1;
	
	end
	
	initial begin
	
		M = 1'b0; #80
		M = 1'b1; #80
		M = 1'b0; #30
		M = 1'b1; #20
		
		$stop;
		
	end
endmodule