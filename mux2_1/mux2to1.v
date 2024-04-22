module mux2to1 (SW, LEDR);
	input [2:0]SW;
	output [0:0]LEDR;
		assign	LEDR[0] = (~SW[2]&SW[0])|(SW[2]&SW[1]);
	endmodule
	