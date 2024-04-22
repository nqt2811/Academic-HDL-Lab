module bai1trang98 (SW,LEDR);
input [2:0]SW;
output reg [0:0]LEDR;
parameter start = 3'b000;
parameter s1 = 3'b001;
parameter s10 = 3'b010;
parameter s101 = 3'b011;
parameter s1011 = 3'b100;
reg[2:0]cs,ns;
always@(*)
begin
	case(cs)
	start: if(SW[2])ns = s1;
	else ns = cs;
	s1: if(~SW[2])ns = s10;
	else ns = cs;
	s10: if(SW[2])ns = s101;
	else ns = start;
	s101: if(SW[2])ns = s1011;
	else ns = s10;
	s1011: if(SW[2])ns = s1;
	else ns = s10;
	default ns = start;
	endcase
end

always @(posedge SW[0] or posedge SW[1])
begin
	if(SW[1]) cs <= start;
	else cs <= ns;
end
always @(*)
begin
if(cs == s1011) LEDR[0] = 1'b1;
else LEDR[0] = 1'b0;
end
endmodule