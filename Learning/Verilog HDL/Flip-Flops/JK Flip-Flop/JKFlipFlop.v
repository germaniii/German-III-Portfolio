//GERMAN E FELISARTA III	 16101002	CpE 3101L Grp 3

module JKFlipFlop(J, K, Reset, Clk, Q, Q_bar);

	input wire J, K, Reset, Clk;
	output reg Q, Q_bar;
	
	
	always @ (negedge Clk) begin
	
		if(Reset) begin
		
			Q <= 1'b0;
			
		end
		
		else begin
		
			case ({J, K})
			
				2'b00 : Q <= Q;
				2'b01 : Q <= 1;
				2'b10 : Q <= 0;	
				2'b11 : begin 
							if(Q == 1) 
								Q <= 0;
							else 
								Q <= 1;
						  end
			endcase
		
		end 
		
		Q_bar <= ~Q;
			
	end

endmodule
