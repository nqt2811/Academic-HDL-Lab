module bai2trang102 (KEY,SW,LEDR);
input [1:0]SW;
input [3:3]KEY;
output reg [0:0]LEDR;
parameter start = 3'b000;
parameter s0 = 3'b001;
parameter s01 = 3'b010;
parameter s011 = 3'b011;
parameter s0110 = 3'b100;
reg[2:0]cs,ns;
always@(*)
begin
	case(cs)
	start: if(~SW[0])ns = s0;
	else ns = cs;
	s0: if(SW[0])ns = s01;
	else ns = cs;
	s01: if(SW[0])ns = s011;
	else ns = s0;
	s011: if(~SW[0])ns = s0110;
	else ns = start;
	s0110: if(SW[0])ns = s01;
	else ns = s0;
	default ns = start;
	endcase
end

always @(negedge KEY[3] or negedge SW[1])
begin
	if(~SW[1]) cs <= start;
	else cs <= ns;
end
always @(*)
begin
if(cs == s0110) LEDR[0] = 1'b1;
else LEDR[0] = 1'b0;
end
endmodule