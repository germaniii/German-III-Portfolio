//German E Felisarta III 16101002 	CpE 3101L Grp 3

module WashingMachineController(CLOCK, nReset, START, Mls, Lls, DIRTY, WET, T1Done, T2Done, Mws, Lws, WASH, RINSE, DRY, T1Start, T2Start);

	input wire CLOCK, nReset, START, Mls, Lls, DIRTY, WET, T1Done, T2Done;
	output reg Mws, Lws, WASH, RINSE, DRY, T1Start, T2Start;
	
	//INPUTS
	//CLOCK, nReset
	//START
	//{Mls,Lls, DIRTY, WET, T1DONE, T2DONE}
	
	//OUTPUTS
	//{Mws, Lws, WASH, RINSE, DRY, T1Start, T2Start}
	
	reg [6:0]cstate, nstate;
	reg [2:0]counter;
	
	parameter A = 7'b0000000;
	parameter B = 7'b1000000;
	parameter C = 7'b1010011;
	parameter D = 7'b1001011;
	parameter E = 7'b1000100;
	parameter F = 7'b0100000;
	parameter G = 7'b0110011;
	parameter H = 7'b0101011;
	parameter I = 7'b0101000;
	
	always @ (posedge CLOCK or negedge nReset)begin
		
		if(!nReset)
			cstate <= A;
		else
			cstate <= nstate;
			
	
	end
	
	always @ (*) begin
	
		if (START) begin
		
			case(cstate)
				A : nstate <= ({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b101000) ? B : F;
				B : nstate <= ({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b101000) ? C : B;
				C : nstate <= ({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b101101) ? D : C;
				
				D : begin
						if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b100111) nstate <= E;
						else if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b101101) nstate <= C;
					 end
					 
				E : begin
						if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b100000) nstate <= A;
						else if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b100111) nstate <= E;
					 end
					 
				F : nstate <= ({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b011000) ? G : F;
				G : nstate <= ({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b011101) ? H : G;
				H : begin
						if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b010111) nstate <= I;
						else if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b011101) nstate <= G;
					 end
					 
				I : begin
						if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b010111) nstate <= I;
						else if({Mls,Lls, DIRTY, WET, T1Done, T2Done} == 6'b010000) nstate <= A;
					 end
		
			endcase
		end
	end

	always @ (*) 
		{Mws, Lws, WASH, RINSE, DRY, T1Start, T2Start} <= cstate;
	
	
endmodule
