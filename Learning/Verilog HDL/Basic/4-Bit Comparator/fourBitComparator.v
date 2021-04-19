
//GERMAN E. FELISARTA III	16101002	CpE3101L

module fourBitComparator(R, A, B);

	input wire [3:0]A;
	input wire [3:0]B;
	output reg [2:0]R;
	
	always @ (*)
		begin 
			if (A > B)
				R[2] = 1;
			else
				R[2] = 0;
			
			if (A == B)
				R[1] = 1;
			else
				R[1] = 0;
				
			if (A < B)
				R[0] = 1;
			else
				R[0] = 0;
		end

endmodule

			
			