module mux2_1_data_8bit(LEDR,SW); 
input [8:0]SW; 
output [3:0]LEDR; 
	mux2_1 m1(LEDR[0],SW[0],SW[4],SW[8]); 
	mux2_1 m2(LEDR[1],SW[1],SW[5],SW[8]); 
	mux2_1 m3(LEDR[2],SW[2],SW[6],SW[8]); 
	mux2_1 m4(LEDR[3],SW[3],SW[7],SW[8]); 
endmodule 
module mux2_1(y,a,b,s); 
input a,b,s; 
output y; 
assign y = (~s&a)|(s&b); 
endmodule 