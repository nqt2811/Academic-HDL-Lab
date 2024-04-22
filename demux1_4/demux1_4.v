module demux1_4(LEDR,SW); 
input [2:0]SW; 
output [3:0]LEDR; 
	assign LEDR[0] = ~SW[2]&~SW[1]& SW[0]; 
	assign LEDR[1] = ~SW[2]& SW[1]& SW[0]; 
	assign LEDR[2] = SW[2]&~SW[1]& SW[0]; 
	assign LEDR[3] = SW[2]& SW[1]& SW[0]; 
endmodule 
