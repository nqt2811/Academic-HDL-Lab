module bai6 (CLOCK_50,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
	input CLOCK_50; 
	output HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
	integer q;
	reg HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0; 
	reg clock_1s = 1'b0;
	reg[3:0]n;
// tao xung clock co f = 1hz	
	always @ (posedge CLOCK_50)
		begin
			q=q+1;
			if (q == 200000000) 
			begin 
				clock_1s = ~clock_1s;
				q = 0;
			end
		end
//counter n
always @ (posedge clock_1s)
begin
		if (n == 4'b1110)
			n <= 4'b0000;
		else
		begin
			n <= n+1;
		end
end
//counter -FPGA-

		always @ (posedge clock_1s)
			case(n)
			4'b0000:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b1111111;
			HEX5 = 7'b1111111;
			HEX4 = 7'b1111111;
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
			end
			4'b0001:
			begin
			HEX7 = 7'b0111111; //-
			HEX6 = 7'b1111111;
			HEX5 = 7'b1111111;
			HEX4 = 7'b1111111;
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
			end
			4'b0010:
			begin
			HEX7 = 7'b1111011; //A
			HEX6 = 7'b0111111; //-
			HEX5 = 7'b1111111;
			HEX4 = 7'b1111111;
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
			end
			4'b0011:
			begin
			HEX7 = 7'b1110111; //G
			HEX6 = 7'b1111011; //A
			HEX5 = 7'b0111111; //-
			HEX4 = 7'b1111111;
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
			end
			4'b0100:
			begin
			HEX7 = 7'b1111001; //P
			HEX6 = 7'b1110111; //G
			HEX5 = 7'b1111011; //A
			HEX4 = 7'b0111111; //-
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
			end
			4'b0101:
			begin
			HEX7 = 7'b1111000; //F
			HEX6 = 7'b1111001; //P
			HEX5 = 7'b1110111; //G
			HEX4 = 7'b1111011; //A
			HEX3 = 7'b0111111; //-
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
			end
			4'b0110:
			begin
			HEX7 = 7'b0111111; //-
			HEX6 = 7'b1111000; //F
			HEX5 = 7'b1111001; //P
			HEX4 = 7'b1110111; //G
			HEX3 = 7'b1111011; //A
			HEX2 = 7'b0111111; //-
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
			end
			4'b0111:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b0111111; //-
			HEX5 = 7'b1111000; //F
			HEX4 = 7'b1111001; //P
			HEX3 = 7'b1110111; //G
			HEX2 = 7'b1111011; //A
			HEX1 = 7'b0111111; //-
			HEX0 = 7'b1111111;
			end
			4'b1000:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b1111111;
			HEX5 = 7'b0111111; //-
			HEX4 = 7'b1111000; //F
			HEX3 = 7'b1111001; //P
			HEX2 = 7'b1110111; //G
			HEX1 = 7'b1111011; //A
			HEX0 = 7'b0111111; //-
			end
			4'b1010:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b1111111;
			HEX5 = 7'b1111111;
			HEX4 = 7'b0111111; //-
			HEX3 = 7'b1111000; //F
			HEX2 = 7'b1111001; //P
			HEX1 = 7'b1110111; //G
			HEX0 = 7'b1111011; //A
			end
			4'b1011:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b1111111;
			HEX5 = 7'b1111111;
			HEX4 = 7'b1111111;
			HEX3 = 7'b0111111; //-
			HEX2 = 7'b1111000; //F
			HEX1 = 7'b1111001; //P
			HEX0 = 7'b1110111; //G
			end
			4'b1100:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b1111111;
			HEX5 = 7'b1111111;
			HEX4 = 7'b1111111;
			HEX3 = 7'b1111111;
			HEX2 = 7'b0111111; //-
			HEX1 = 7'b1111000; //F
			HEX0 = 7'b1111001; //P
			end
			4'b1101:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b1111111;
			HEX5 = 7'b1111111;
			HEX4 = 7'b1111111;
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b0111111; //-
			HEX0 = 7'b1111000; //F
			end
			4'b1110:
			begin
			HEX7 = 7'b1111111;
			HEX6 = 7'b1111111;
			HEX5 = 7'b1111111;
			HEX4 = 7'b1111111;
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b0111111; //-
			end
		endcase
	
endmodule
