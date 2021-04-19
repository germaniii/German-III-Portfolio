//German E Felisarta III 16101002	CpE 3101L Grp 3

`timescale 1 ns / 1 ps
module tb_nBitRegisterSet();

	localparam n = 8;

	reg Clk, nReset, Enable, RW;
	reg [2:0]Address;
	reg [n-1:0]Data_in;
	
	wire [n-1:0]Data_out;
	
	nBitRegisterSet UUT (Clk, nReset, Enable, RW, Address, Data_in, Data_out);
	
	initial 
		Clk = 1'b0;
		
	always
		#5 Clk = ~Clk;
		
	initial begin
		nReset = 1'b0; #10
		nReset = 1'b1;
	end
	
	initial begin
		$display("Starting simulation at %0d ns... ", $time);
		
		{RW, Enable} = 2'b10; #10
		{RW, Enable, Address} = 5'b11000;
		Data_in = 8'b01010101; #10
		{RW, Enable, Address} = 5'b11001;
		Data_in = 8'b00001111; #10
		{RW, Enable, Address} = 5'b11010;
		Data_in = 8'b00110011; #10
		{RW, Enable, Address} = 5'b11011;
		Data_in = 8'b00011101; #10
		{RW, Enable, Address} = 5'b11100;
		Data_in = 8'b10101010; #10
		{RW, Enable, Address} = 5'b11101;
		Data_in = 8'b11001100; #10
		{RW, Enable, Address} = 5'b11110;
		Data_in = 8'b11100010; #10
		{RW, Enable, Address} = 5'b11111;
		Data_in = 8'b11111111; #10
		
		$display("Finished simulation at %0d ns.", $time);
		$stop;
	end

endmodule
		
		
		
		
		
		