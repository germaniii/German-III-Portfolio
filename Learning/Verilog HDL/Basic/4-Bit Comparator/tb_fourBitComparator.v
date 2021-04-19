//GERMAN E FELISARTA III 16101002	CpE3101L Grp 3

`timescale 1 ns / 1 ps
module tb_fourBitComparator();

	reg [3:0]A;
	reg [3:0]B;
	
	wire [2:0]R;
	
	fourBitComparator UUT (R, A, B);
	
	initial begin
		$display ("Starting simulation at %0d ns..", $time);
		
		A = 4'b0000;
		B = 4'b0100;
		
		repeat(10)
		#5 A = A + 4'b0001;
		
		
		
		$display ("Finished simulation at %0d ns.", $time);
		
		$stop;
	end
	
endmodule
