//German E Felisarta III	16101002		CpE3101L Grp3

`timescale 1 ns / 1 ps
module tb_TFlipFlop();

	reg Clk, nReset, T;
	wire Q, Q_bar;
	
	TFlipFlop UUT (T, nReset, Clk, Q, Q_bar);
	
	initial
		Clk = 1'b0;
	
	always
		#5 Clk = ~Clk;
		
	initial begin
		nReset = 1'b0; #10
		nReset = 1'b1;
	end
	
	initial begin
		$display("Starting Simulation at %0d ns..", $time);
		T = 1'b0; #12
		T = 1'b1; #25
		T = 1'b0; #10
		T = 1'b0; #12
		T = 1'b1; #10
		$display("Finished simulation at %0d ns.", $time);
		$stop;
	end

endmodule
