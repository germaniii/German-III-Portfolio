//German E Felisarta III 16101002	CpE 3101L Grp 3

module nBitRegisterSet(Clk, nReset, Enable, RW, Address, Data_in, Data_out);

	localparam n = 8;

	input wire Clk, nReset, Enable, RW;
	input wire [2:0]Address;
	input wire [n-1:0]Data_in;
	
	output reg [n-1:0]Data_out;
	
	always @ (negedge Clk)
	
		if(!nReset) begin
			Data_out <= 8'b00000000;
		end
		else begin
		
			if(RW == 0) //read mode
				Data_out <= 8'bzzzzzzzz;
			else begin
				if (Enable == 1) //write mode
				Data_out <= Data_in;
				
			end
	end
	
endmodule

	
	