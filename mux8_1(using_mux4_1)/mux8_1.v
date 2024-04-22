module mux8_1 (SW, LEDR);
	input [10:0]SW;
	output [0:0]LEDR;
	wire tmp1, tmp2;
	not (notc, SW[10]);
	or (LEDR[0],tmp1,tmp2);
	mux4_1 m0(tmp1,SW[7],SW[6],SW[5],SW[4],notc,SW[9]);
	mux4_1 m1(tmp2,SW[3],SW[2],SW[1],SW[0],SW[10],SW[8]);
	
endmodule
module mux4_1(y,a,b,c,d,s1,s0); 
	input a,b,c,d,s1,s0; 
	output y;
		assign y = (~s1 & ~s0 & a) | (~s1 & s0 & b) | (s1 & ~s0 & c) | (s1 & s0 & d); 
endmodule 