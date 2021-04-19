//German E Felisarta III 16101002	CpE 3101L Grp 3

`timescale 1 ns / 1 ps
module tb_WashingMachineController();

	reg CLOCK, nReset, START, Mls, Lls, DIRTY, WET, T1Done, T2Done;
	wire Mws, Lws, WASH, RINSE, DRY, T1Start, T2Start;
	
	WashingMachineController UUT (CLOCK, nReset, START, Mls, Lls, DIRTY, WET, T1Done, T2Done, Mws, Lws, WASH, RINSE, DRY, T1Start, T2Start);
	
	initial CLOCK = 1'b0;
	
	always #5 CLOCK = ~CLOCK;
	
	initial begin
		nReset = 1'b0; #10
		nReset = 1'b1;
	end
	
	initial begin
		START = 1'b0; #10
		START = 1'b1; 
	end
	
	initial begin
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b101000;#15 //@A going B
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b101000;#15 //@B going C
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b101101;#15	//@C going D	#1
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b101101;#15	//@D going C
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b101101;#15	//@C going D	#2
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b101101;#15	//@D going C
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b101101;#15	//@C going D	#3
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b100111;#15	//@D going E
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b100111;#15	//@E first loop to 20Mins
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b100000;#10//@E going A
		
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b011000;#15 //@A going F
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b011000;#15 //@F going G
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b011101;#15	//@G going H	#1
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b011101;#15	//@H going G
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b011101;#15	//@G going H	#2
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b011101;#15	//@H going G
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b011101;#15	//@G going H	#3
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b010111;#15	//@H going I
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b010111;#15	//@I first loop to 20Mins
		{Mls,Lls, DIRTY, WET, T1Done, T2Done} = 6'b010000;#15	//@I going A
		
		$stop;
	end
	
endmodule
