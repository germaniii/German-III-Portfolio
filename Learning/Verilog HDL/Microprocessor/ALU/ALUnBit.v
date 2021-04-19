//German E Felisarta III 	16101002 	CpE 3101L Grp 3

module ALUnBit(A, B, CB_in, Mode, Result, CB_out);
	
	localparam n = 4;
	
	input wire [(n-1):0]A;
	input wire [(n-1):0]B;
	input wire CB_in;
	input wire [2:0]Mode;
	
	output reg CB_out;
	output reg [(n-1):0]Result;
	
	always @(*)
		begin
			case (Mode)
			
				3'b000 : 
					begin Result = (A + B); CB_out = 1; end
				3'b001 :	
					begin Result = (A - B); CB_out = 1; end
				3'b010 : 
					Result = (A & B);
				3'b011 :	
					Result = (A | B);
				3'b100 : 
					Result = (A ^ B);
				3'b101 :	
					Result = (~A);
				3'b110 :	
					Result = (A + 1'b1);
				3'b111 :	
					Result = (A - 1'b1);
				
			endcase
		end

endmodule
	

	