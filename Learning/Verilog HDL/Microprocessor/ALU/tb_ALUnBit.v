//German E Felisarta III	16101002	CpE 3101L Grp 3

`timescale 1 ns / 1 ps
module tb_ALUnBit();
	
	localparam n = 4; 
	
	reg [(n-1):0]A;
	reg [(n-1):0]B;
	reg CB_in;
	reg [2:0]Mode;
	
	wire CB_out;
	wire [(n-1):0]Result;
	
	ALUnBit UUT (A, B, CB_in, Mode, Result, CB_out);
	
	initial begin 
		$display("Starting simulation at %0d ns...", $time);
		
		//000
		Mode = 3'b000;
		
		A = 4'b0001; B = 4'b0010; CB_in = 1'b1; #5
		
		A = 4'b0011; B = 4'b0001; CB_in = 1'b1; #5
		
		A = 4'b0101; B = 4'b0010; CB_in = 1'b0; #5
		
		//001
		Mode = 3'b001;
		
		A = 4'b0011; B = 4'b0010; #5
		
		
		A = 4'b0111; B = 4'b0011; #5
		
		A = 4'b0001; B = 4'b0010; #5
		
		//010
		Mode = 3'b010;
		
		A = 4'b0011; B = 4'b0010; #5
		
		A = 4'b0111; B = 4'b0111; #5
		
		A = 4'b0010; B = 4'b0010; #5
		
		//011
		Mode = 3'b011;
		
		A = 4'b0011; B = 4'b0010; #5
		
		
		A = 4'b0111; B = 4'b0111; #5
		
		A = 4'b0010; B = 4'b0010; #5
		
		//100
		Mode = 3'b100;
		
		A = 4'b0011; B = 4'b0010; #5
		
		A = 4'b0111; B = 4'b0111; #5
		
		A = 4'b0010; B = 4'b0010; #5
		
		//101
		Mode = 3'b101;
		
		A = 4'b0011; #5
		
		A = 4'b0111; #5
		
		A = 4'b0010; #5
		
		//110
		Mode = 3'b110;
		
		A = 4'b0011; #5
		
		A = 4'b0111; #5
		
		A = 4'b0010; #5
		
		//111
		Mode = 3'b111;
		
		A = 4'b0011; #5
		
		A = 4'b0111; #5
		
		A = 4'b0010; #5
		
		
		$display("Finished simulation at %0d ns.", $time);
		$stop;
	end
	
endmodule
