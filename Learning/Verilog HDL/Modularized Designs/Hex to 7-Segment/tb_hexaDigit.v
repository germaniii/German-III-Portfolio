//GERMAN E FELISARTA III 	16101002	CpE 3101L Group 3

`timescale 1 ns / 1 ps
module tb_hexaDigit();

	reg DP;
	reg [3:0]Hex;
	wire [7:0]SSeg;
	
	hexaDigit UUT (Hex, DP, SSeg);
	
	initial begin
		$display ("Starting simulation at %0d ns...", $time);
		
		
		{DP, Hex} = 5'b00000; #5
		{DP, Hex} = 5'b00110; #5
		{DP, Hex} = 5'b00010; #5
		{DP, Hex} = 5'b01001; #5
		{DP, Hex} = 5'b01100; #5
		{DP, Hex} = 5'b01110; #5
		{DP, Hex} = 5'b01000; #5
		{DP, Hex} = 5'b00001; #5
		{DP, Hex} = 5'b00011; #5
		{DP, Hex} = 5'b01111; #5
		
		
		$display ("Finished simulation at %0d ns...", $time);
		$stop;
		
	end
	
endmodule
