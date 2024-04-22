module mux4_1(LEDR,SW); 
 input [5:0]SW; 
 output [1:0]LEDR; 
 wire tmp1,tmp2; 
	mux2_1 M0 (tmp1,SW[2],SW[3],SW[0]); 
	mux2_1 M1 (tmp2,SW[4],SW[5],SW[0]); 
	mux2_1 M2 (LEDR[0],tmp1,tmp2,SW[1]); 
endmodule 


//modul con mux2_1 
module mux2_1(y,a,b,s); 
	input a,b,s; 
	output y;
		assign y = (~s & a) | (s & b); 
endmodule 
