module mux2_1_data2bit(LEDR,SW); 
input [4:0]SW; 
output [1:0]LEDR; 
	mux2_1 m1(LEDR[0],SW[0],SW[2],SW[4]); 
	mux2_1 m2(LEDR[1],SW[1],SW[3],SW[4]); 
endmodule 
module mux2_1(y,a,b,s); 
input a,b,s; 
output y; 
assign y = (~s&a)|(s&b); 
endmodule 