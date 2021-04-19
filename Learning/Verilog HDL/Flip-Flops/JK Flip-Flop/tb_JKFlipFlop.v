//German E Felisarta III	16101002 	CpE 3101LGrp3

`timescale 1 ns / 1 ps
module tb_JKFlipFlop();

	reg J, K, Reset, Clk;
	wire Q, Q_bar;
	
	JKFlipFlop UUT (J, K, Reset, Clk, Q, Q_bar);
	
	initial
		Clk = 1'b0;
		
	always
		#5	Clk = ~Clk;
		
	initial begin
		Reset = 1'b1; #10
		Reset = 1'b0;
	end
	
	initial begin
		$display("Starting simulation at %0d ns...", $time);
		
		{J,K} = 2'b00; #12
		{J,K} = 2'b10; #25
		{J,K} = 2'b01; #10
		{J,K} = 2'b11; #12
		{J,K} = 2'b01; #10
		
		
		$display("Finished simulation at %0d ns.", $time);
		$stop;
	end
	
endmodule
