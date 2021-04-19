//German E Felisarta III 16101002	CpE 3101L Grp 3

module RaceLightsController(CLOCK, nReset, START, RED, YELLOW, GREEN);

	input wire CLOCK, nReset, START;
	output reg RED, YELLOW, GREEN;
	
	parameter R = 3'b100; //RED
	parameter Y = 3'b010; //YELLOW
	parameter G = 3'b001; //GREEN
	
	parameter A = 3'b000;
	parameter B = 3'b001;
	parameter C = 3'b010;
	parameter D = 3'b011;
	parameter E = 3'b100;
	parameter F = 3'b101;
	
	reg [2:0] cstate, nstate;
	reg [1:0] counter;//00, 01, 10
	
	always @ (posedge CLOCK or negedge nReset) begin
	
			if(!nReset)
				cstate <= A;
			else 
				cstate <= nstate;
	
	end
	
	always @ (START, cstate) begin
		if (START) begin
			case(cstate)
				3'b000 : nstate <= B;
				3'b001 : nstate <= C;
				3'b010 : nstate <= D;
				3'b011 : nstate <= E;
				3'b100 : nstate <= F;
				default : nstate <= A;
			endcase
		end
	end
	
	
	always @ (*) begin
		case(cstate)
			3'b000 : {RED,YELLOW,GREEN} <= R;
			3'b001 : {RED,YELLOW,GREEN} <= Y;
			3'b010 : {RED,YELLOW,GREEN} <= G;
			3'b011 : {RED,YELLOW,GREEN} <= G;
			3'b100 : {RED,YELLOW,GREEN} <= G;
			3'b101 : {RED,YELLOW,GREEN} <= G;
			default: {RED,YELLOW,GREEN} <= R;
		endcase
	end
endmodule	