//Test BenchFile for Ex4A
//German  E Felisarta III 16101002

`timescale 1 ns / 1 ps
module tb_Exercise4A ();

	reg [3:0]A;
	reg [3:0]B;
	
	wire [2:0]R;
	
	Exercise4A UUT (R, A, B);
	
	//generate stimuli
	initial
		begin
			A = 4'b0000; B = 4'b0000; #10
			A = 4'b0010; B = 4'b0001; #10
			A = 4'b0100; B = 4'b0101; #10
			A = 4'b0000; B = 4'b0000; #10
			A = 4'b1000; B = 4'b1000; #10
			A = 4'b0101; B = 4'b0010; #10
			A = 4'b0100; B = 4'b1000; #10
			A = 4'b0001; B = 4'b0100; #10
			A = 4'b0110; B = 4'b0110; #10
			A = 4'b1001; B = 4'b1010; #10
			
			$stop;
	end

endmodule
	

			
			
			
			
			
	