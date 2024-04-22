module bai5(SW,HEX0);
input [3:0]SW;
output reg[6:0]HEX0;
always @ (SW)
begin
case (SW)
4'b0000: HEX0 = 7'b 1000000; //0
4'b0001: HEX0 = 7'b 1111001; //1
4'b0010: HEX0 = 7'b 0100100; //2
4'b0011: HEX0 = 7'b 0110000; //3
4'b0100: HEX0 = 7'b 0011001; //4
4'b0101: HEX0 = 7'b 0010010; //5
4'b0110: HEX0 = 7'b 0000010; //6
4'b0111: HEX0 = 7'b 1111000; //7
4'b1000: HEX0 = 7'b 0000000; //8
4'b1001: HEX0 = 7'b 0010000; //9
endcase
end
endmodule


module dem30 (SW, LEDR);
input [2:0]SW;
output [5:1]LEDR;
reg [5:1]LEDR;
always @ (posedge SW[0] or negedge SW[1])
begin
	if (SW[1] == 1'b0)
	LEDR <= 5'b00000;
else 
begin
	LEDR <= LEDR + 1;
	if (LEDR == 5'b11100)
	LEDR <= 5'b00000;
	HEX[0] = LEDR % 10
	HEX[1] = LEDR / 10
	end
end
endmodule
