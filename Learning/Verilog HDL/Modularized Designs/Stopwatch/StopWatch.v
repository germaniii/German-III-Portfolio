//German E Felisarta III 16101002	CpE 3101L Grp 3

module StopWatch(Clk, nReset, Start, S0, S1, S2);

	input wire Clk, nReset, Start;
	output reg [7:0]S0;
	output reg [7:0]S1;
	output reg [7:0]S2;
	
	wire [3:0]wHex0;
	wire [3:0]wHex1;
	wire [3:0]wHex2;
	
	wire [7:0]wS0;
	wire [7:0]wS1;
	wire [7:0]wS2;
	
	reg EnableDec, EnableOnes, EnableTens;
	
	BCDCounter BC0(Clk, nReset, EnableDec, wHex0);
	BCDCounter BC1(Clk, nReset, EnableOnes, wHex1);
	BCDCounter BC2(Clk, nReset, EnableTens, wHex2);
	
	hexaDigit  HD0(wHex0, 1'b0, wS0);
	hexaDigit  HD1(wHex1, 1'b0, wS1);
	hexaDigit  HD2(wHex2, 1'b0, wS2);
	
	
	
	always @ (negedge Clk) begin
	
		S0 <= wS0;
		S1 <= wS1;
		S2 <= wS2;
		
		if(Start) begin
			EnableDec <= 1'b1;
			if(wS0 == 4'b1001) EnableOnes <= 1'b1;
			if(wS1 == 4'b1001) EnableTens <= 1'b1;
			
		end
		else begin
		
			EnableDec <= 1'b0;
			EnableOnes <= 1'b0;
			EnableTens <= 1'b0;
			
		end
	end	
endmodule



module BCDCounter(xClk, xnReset, Enable, Count_out);
	
	input xClk, xnReset, Enable;
	output reg [3:0]Count_out;
	
	always @ (negedge xClk) begin

	
		if(!xnReset) Count_out <= 4'b0000;
		else begin
		
			if(Enable) begin
				if (Count_out == 4'b1010)
					Count_out <= 4'b0000;
				else
					Count_out <= (Count_out + 1'b1);
				
			end
			else Count_out <= Count_out;
			
		end
	
	end

endmodule


//GERMAN E FELISARTA III 16101002	CpE 3101L EX5B

module hexaDigit(Hex, DP, SSeg);
	
	input wire [3:0]Hex;
	input wire DP;
	output reg [7:0]SSeg;
	
	always @ (*) begin
	
				case ({DP, Hex})
					5'b00000 : SSeg = 8'b0111111;
					5'b00001 : SSeg = 8'b0000110;
					5'b00010 : SSeg = 8'b1011011;
					5'b00011 : SSeg = 8'b1001111;
					5'b00100 : SSeg = 8'b1100110;
					5'b00101 : SSeg = 8'b1101101;
					5'b00110 : SSeg = 8'b1111101;
					5'b00111 : SSeg = 8'b0000111;
					5'b01000 : SSeg = 8'b1111111;
					5'b01001 : SSeg = 8'b1101111;
					5'b01010 : SSeg = 8'b1110111;
					5'b01011 : SSeg = 8'b1111100;
					5'b01100 : SSeg = 8'b0111001;
					5'b01101 : SSeg = 8'b1011110;
					5'b01110 : SSeg = 8'b1111001;
					5'b01111 : SSeg = 8'b1110001;
					default  : SSeg = 8'b0000000;
					
				endcase
		end
		
endmodule