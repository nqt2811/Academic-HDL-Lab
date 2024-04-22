module mux4_1_data_2bit(SW, LEDR);
	input [9:0]SW;
	output [1:0]LEDR;
	mux4_1 m0 (LEDR[0],SW[7],SW[5],SW[3],SW[1],SW[9],SW[8]);
	mux4_1 m1 (LEDR[1],SW[6],SW[4],SW[2],SW[0],SW[9],SW[8]);
endmodule

//modul con mux4_1 
module mux4_1(y,a,b,c,d,s1,s0); 
	input a,b,c,d,s1,s0; 
	output y;
		assign y = (~s1 & ~s0 & a) | (~s1 & s0 & b) | (s1 & ~s0 & c) | (s1 & s0 & d); 
endmodule 
