
//German E Felisarta III	16101002	Group 3 M 07:30 AM - 10:30 AM

module HalfAdder (x, y, c, s);

	input 	x, y;
	output 	c, s;
	
	xor 		X1 (s, x, y);
	and		A1 (c, x, y);
	
endmodule
