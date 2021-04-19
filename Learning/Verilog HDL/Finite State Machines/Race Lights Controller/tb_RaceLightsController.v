//GERMAN E FELISARTA III 16101002 CpE 3101L Grp 3

`timescale 1 ns / 1 ps
module tb_RaceLightsController();

	reg CLOCK, nReset, START;
	wire RED, YELLOW, GREEN;
	
	RaceLightsController UUT (CLOCK, nReset, START, RED, YELLOW, GREEN);
	
	initial CLOCK = 1'b0;
	
	always #5 CLOCK = ~CLOCK;
	
	initial begin
		nReset = 1'b0; #10;
		nReset = 1'b1;
	end
	
	initial begin
	
		START = 1'b1; #70
	
		$stop;
	end

endmodule
