//GERMAN E FELISARTA III 16101002	CpE3101L Grp 3

module spinDisk (Clk, nReset, Start, SSeg);

	input wire Clk, nReset, Start;
	output reg [7:0]SSeg;
	wire C0;
	
	 
	always @ (posedge Clk) begin
	
		
			if (!nReset) C0 = 3'b000;
				
	end	
				
endmodule

module counterModule (cClk, cStart, cCounter_Out);
	
	input cClk, cStart;
	output [2:0]cCounter_Out;
		
		if(cStart) begin
		
			cCounter_Out = (cCounter_Out + 1'b1);
			
				if (cCounter_Out == 3'b111)
					cCounter_Out = 3'b000;
		
		end
		else cCounter_out = 3'b000;
			
endmodule


module SSegDecoder(sCounter_Out, SSeg);
		
	input sCounter_Out;
	output [7:0]SSeg;
	
		case (sCounter_Out)
	
			3'b000 : SSeg = 8'b00000000; 
			3'b001 : SSeg = 8'b01100010; // BGF
			3'b010 : SSeg = 8'b01100001; // GFA
			3'b011 : SSeg = 8'b00100011; // FAB
			3'b100 : SSeg = 8'b01000011; // ABG
			3'b101 : SSeg = 8'b01100011; // ABGF
			3'b110 : SSeg = 8'b00000000; 
			3'b111 : SSeg = 8'b01100011; // ABGF
		
		endcase
	
endmodule
	
		