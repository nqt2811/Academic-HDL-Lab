//Phat hien chuoi 01000101
module phathienchuoi(SW,CLOCK_50, HEX3, HEX2, HEX1, HEX0);
input [1:0]SW;
input [3:3]KEY;
output reg [6:0]LEDG;
output reg [0:0]LEDR;
parameter start = 4'b0000;
parameter s0 = 4'b0001;
parameter s01 = 4'b0010;
parameter s010 = 4'b0011;
parameter s0100 = 4'b0100;
parameter s01000 = 4'b0101;
parameter s010001 = 4'b0110;
parameter s0100010 = 4'b0111;
parameter s01000101 = 4'b1000;
reg[3:0]cs,ns;
always@(*)
begin
	case(cs)
	start: if(SW[0])ns = cs;
	else ns = s0;
	s0: if(SW[0])ns = s01;
	else ns = cs;
	s01: if(SW[0])ns = start;
	else ns = s010;
	s010: if(SW[0])ns = s01;
	else ns = s0100;
	s0100: if(SW[0])ns = s01;
	else ns = s01000;
	s01000: if(SW[0])ns = s010001;
	else ns = s0;
	s010001: if(SW[0])ns = start;
	else ns = s0100010;
	s0100010: if(SW[0])ns = s01000101;
	else ns = s0100;
	s01000101: if(SW[0])ns = start;
	else ns = s010;
	default ns = start;
	endcase
end

always @(negedge KEY[3])
begin
	if(SW[1]) cs <= start;
	else cs <= ns;
end

always @ (*)
begin
if(cs == s0) LEDG[0] = 1'b1;
else LEDG[0] = 1'b0;
if(cs == s01) LEDG[1] = 1'b1;
else LEDG[1] = 1'b0;
if(cs == s010) LEDG[2] = 1'b1;
else LEDG[2] = 1'b0;
if(cs == s0100) LEDG[3] = 1'b1;
else LEDG[3] = 1'b0;
if(cs == s01000) LEDG[4] = 1'b1;
else LEDG[4] = 1'b0;
if(cs == s010001) LEDG[5] = 1'b1;
else LEDG[5] = 1'b0;
if(cs == s0100010) LEDG[6] = 1'b1;
else LEDG[6] = 1'b0;
if(cs == s01000101) LEDR[0] = 1'b1;
else LEDR[0] = 1'b0;
end
endmodule
