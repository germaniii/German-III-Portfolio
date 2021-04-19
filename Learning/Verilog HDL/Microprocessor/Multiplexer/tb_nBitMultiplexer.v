//TestBench File for nBit Multiplexer

`timescale 1 ns / 1 ps
module tb_nBitMultiplexer();

	reg [3:0]A;
	reg [3:0]B;
	reg [3:0]C;
	reg [3:0]D;
	reg [1:0]S;
	
	wire [3:0]Y;
	
	nBitMultiplexer UUT (A, B, C, D, S, Y);
	
	initial
		begin
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b000; #10
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b001; #10
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b010; #10
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b011; #10
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b100; #10
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b101; #10
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b110; #10
			A = 8'b0001; B = 8'b0010; C = 8'b0011; D = 8'b0100; S = 3'b111; #10
		$stop;
	end
	
endmodule
