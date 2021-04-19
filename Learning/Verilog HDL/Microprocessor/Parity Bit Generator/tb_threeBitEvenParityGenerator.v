//TestBench file for 3Bit Parity Gen

`timescale 1 ns / 1 ps
module tb_threeBitEvenParityGenerator();

	reg [2:0]A;
	reg E;
	
	wire P;
	
	threeBitEvenParityGenerator UUT (A, E, P);

	initial
		begin
			A = 3'b000; E = 0; #10
			A = 3'b001; E = 1; #10
			A = 3'b010; E = 0; #10
			A = 3'b011; E = 1; #10
			A = 3'b100; E = 0; #10
			A = 3'b101; E = 1; #10
			A = 3'b110; E = 0; #10
			A = 3'b111; E = 1; #10
			
		$stop;
	end
	
endmodule
