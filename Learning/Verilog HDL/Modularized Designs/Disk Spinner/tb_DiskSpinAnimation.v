//GERMAN E FELISARTA III 16101002	CpE 3101L Grp 3

`timescale 1 ns / 1 ps
module tb_DiskSpinAnimation();

	reg Clk, nReset, Start;
	wire [7:0]SSeg;
	
	DiskSpinAnimation_Top  UUT (Clk, nReset, Start, SSeg);
	
	initial
		Clk = 1'b0;
	
	always
		#5 Clk = ~Clk;
		
	initial begin
		nReset = 1'b1; #10
		nReset = 1'b0;
	end
	
	initial begin
		$display("Starting Simulation at %0d ns...", $time);
		
		Start = 1'b1; #90
		Start = 1'b0; #30
		
		$display("Finished simulation at %0d ns...", $time);
		$stop;
		
	end
endmodule

	