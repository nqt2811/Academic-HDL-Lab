module mux5_1(SW, LEDR);
	input [7:0]SW;
	output [0:0]LEDR;
	wire tmp1, tmp2, tmp3;
	mux2_1 m0(tmp1,SW[4],SW[3],SW[5]);
	mux2_1 m1(tmp2,SW[2],SW[1],SW[5]);
	mux2_1 m2(tmp3,tmp1,tmp2,SW[6]);
	mux2_1 m3(LEDR[0],tmp3,SW[0],SW[7]);
endmodule



//modul con mux2_1 
module mux2_1(y,a,b,s); 
	input a,b,s; 
	output y;
		assign y = (~s & a) | (s & b); 
endmodule 