//GERMAN E FELISARTA III 16101002	CpE3101L Grp 3

module DiskSpinAnimation_Top (Clk, nReset, Start, SSeg);

	input wire Clk, nReset, Start;
	output reg [7:0]SSeg;
	wire [2:0]C0;
	wire [7:0]sSSeg;
	
	counterModule CM0(Clk, Start, nReset, C0);
	SSegDecoder  SSD0(C0, sSSeg);
	
	always @ (*) begin
			
		SSeg <= sSSeg;
			
	end	
				
endmodule

module counterModule (cClk, cStart, cReset, cCounter_Out);
	
	input cClk, cStart, cReset;
	output reg [2:0]cCounter_Out;
		
	always @ (posedge cClk) begin
	
		if(cStart) begin
				
			cCounter_Out <= 3'b000;
	
			if(!cReset) begin
		
				cCounter_Out <= (cCounter_Out + 1'b1);
			
					if (cCounter_Out == 3'b111)
						cCounter_Out <= 3'b000;
			
			end
			else cCounter_Out <= 3'b000;
				
		end
		else cCounter_Out <= 3'b000;

	end
			
endmodule


module SSegDecoder(sCounter_Out, SSeg);
		
	input wire [2:0]sCounter_Out;
	output reg [7:0]SSeg;
	
	always @ (*) begin
	
		case (sCounter_Out)
	
			3'b000 : SSeg <= 8'b00000000; 
			3'b001 : SSeg <= 8'b01100010; // BGF
			3'b010 : SSeg <= 8'b01100001; // GFA
			3'b011 : SSeg <= 8'b00100011; // FAB
			3'b100 : SSeg <= 8'b01000011; // ABG
			3'b101 : SSeg <= 8'b01100011; // ABGF
			3'b111 : SSeg <= 8'b01100011; // ABGF
			default : SSeg <= 8'b00000000;
		
		endcase
	
	end
	
endmodule
	
		

	
		
	
		