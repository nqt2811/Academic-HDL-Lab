//Phat hien chuoi 01000101
module baithi(SW,LEDG,KEY);
input [1:0]SW;
input [3:3]KEY;
output reg [7:0]LEDG;
parameter start = 3'b000;
parameter s1 = 3'b001;
parameter s10 = 3'b010;
parameter s101 = 3'b011;
parameter s1010 = 3'b100;
parameter s10101 = 3'b101;
parameter s101011 = 3'b110;
reg[2:0]cs,ns;
always@(*)
begin
	case(cs)
	start: if(SW[0])ns = s1;
	else ns = cs;
	s1: if(SW[0])ns = cs;
	else ns = s10;
	s10: if(SW[0])ns = s101;
	else ns = start;
	s101: if(SW[0])ns = s1;
	else ns = s1010;
	s1010: if(SW[0])ns = s10101;
	else ns = start;
	s10101: if(SW[0])ns = s101011;
	else ns = s1010;
	s101011: if(SW[0])ns = s1;
	else ns = s10;
	default ns = start;
	endcase
end

always @(posedge KEY[3] or negedge SW[1])
begin
	if(~SW[1]) cs <= start;
	else cs <= ns;
end

//Khi phat hien chuoi LEDG[7] sang
//LEDG[4:0] sang de muc dich kiem tra SW khong bi doi nguoc!!!! ok
always @ (*)
begin
if(cs == s1) LEDG[0] = 1'b1;
else LEDG[0] = 1'b0;
if(cs == s10) LEDG[1] = 1'b1;
else LEDG[1] = 1'b0;
if(cs == s101) LEDG[2] = 1'b1;
else LEDG[2] = 1'b0;
if(cs == s1010) LEDG[3] = 1'b1;
else LEDG[3] = 1'b0;
if(cs == s10101) LEDG[4] = 1'b1;
else LEDG[4] = 1'b0;
if(cs == s101011) LEDG[7] = 1'b1;
else LEDG[7] = 1'b0;

end
endmodule
