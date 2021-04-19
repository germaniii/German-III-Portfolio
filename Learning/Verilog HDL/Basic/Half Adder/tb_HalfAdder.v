`timescale 1 ns / 1 ps
module tb_HalfAdder();

	//all inputs from UUT are reg type
	reg x,y;
	//all outputs from UUT are wire type
	wire C,S;
	//instatntiate UUT with implicit port mapping
	HalfAdder UUT(x, y, C,S);
	
	//generate stimuli
	initial
	begin
		x = 0; y = 0; #10
		x = 0; y = 1; #10
		x = 1; y = 0; #10
		x = 1; y = 1; #50
		
			$stop;
		end
	
	endmodule
	