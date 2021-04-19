//German E Felisarta III 16101002 CpE 3101L Grp 3

module ComplexCounter(CLOCK, nReset, M, COUNT);

	input wire CLOCK, nReset, M;
	output reg [2:0]COUNT;
	
	parameter A = 3'b000;
	parameter B = 3'b001;
	parameter C = 3'b010;
	parameter D = 3'b011;
	parameter E = 3'b100;
	parameter F = 3'b101;
	parameter G = 3'b110;
	parameter H = 3'b111;
	reg [2:0]cstate, nstate;
	
	always @ (posedge CLOCK or negedge nReset)begin
	
		if (!nReset)
			cstate <= A;
		else
			cstate <= nstate;

	end
	
	always @ (*) begin
	
		case(cstate)
		
			A : nstate <= (M) ? B : B;
			B : nstate <= (M) ? D : C;
			C : nstate <= (M) ? G : D;
			D : nstate <= (M) ? C : E;
			E : nstate <= (M) ? A : F;
			F : nstate <= (M) ? E : G;
			G : nstate <= (M) ? H : H;
			default : nstate <= (M) ? F : A;
			
		endcase
	
	end
	
	always @ (*) begin
	
		COUNT <= cstate;
	
	end
endmodule
	
	
	
