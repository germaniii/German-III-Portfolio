//German E Felisarta III 16101002 CpE 3101L Grp 3

`timescale 1 ns / 1 ps
module tb_StopWatch();

	reg Clk, nReset, Start;
	wire [7:0]S0;
	wire [7:0]S1;
	wire [7:0]S2;
	
	StopWatch UUT (Clk, nReset, Start, S0, S1, S2);
	
	initial
		Clk = 1'b0;
	
	always
		#10 Clk = ~Clk;
		
	initial begin
		nReset = 1'b1; #10
		nReset = 1'b0;
	end
	
	initial begin
		$display("Starting simulation");
		
		Start = 1'b1; #200
		Start = 1'b0; #50
		
		$display("Finished Simulation");
		$stop;
		
	end

endmodule
