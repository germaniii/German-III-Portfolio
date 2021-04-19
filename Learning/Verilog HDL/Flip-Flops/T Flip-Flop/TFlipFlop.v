//GERMAN E FELISARTA III 	16101002		CpE3101L Grp3

module TFlipFlop(T, nReset, Clk, Q, Q_bar);
	
	input wire T, nReset, Clk;
	output reg Q, Q_bar;
	
	always @ (posedge Clk) begin
		
		if(!nReset)
			Q <= 1'b0;
			
		else
				if (T == Q) begin
					Q <= 1'b0;
					Q_bar <= ~Q;	
				end
				else begin
					Q <= 1'b1;
					Q_bar <= ~Q;	
				end
	end

endmodule
	