//00-60
module bai3 (KEY,SW,HEX1,HEX0);
input [3:3]KEY;
input [0:0]SW;
output  [6:0] HEX1,HEX0;
wire [3:0] ch, dv;
reg [3:0] bcd1, bcd2;
always @ (posedge KEY)
begin
	if ((SW == 1) | (bcd2 == 4'b0110 & bcd1 == 4'b0000))
	begin
			bcd1 <= 4'b0000;
			bcd2 <= 4'b0000;
	end
	else
	begin
			bcd1 <= bcd1 + 1;
			if (bcd1 == 4'b1001)
			begin
				bcd1 <= 4'b0000;
				bcd2 <= bcd2 + 1;
				if (bcd2 == 4'b1001) bcd2 <= 4'b0000;
			end
	end
end	
assign ch = bcd2; //chuyen kieu reg sang kieu wire
assign dv = bcd1;
bcd7seg(dv,HEX0);
bcd7seg(ch,HEX1);
endmodule
module bcd7seg(bcd,display);
input [3:0]bcd;
output [6:0]display;
reg [6:0]display;
always@(bcd) begin
case(bcd)
4'b0000: display=7'b1000000;
4'b0001: display=7'b1111001;
4'b0010: display=7'b0100100;
4'b0011: display=7'b0110000;
4'b0100: display=7'b0011001;
4'b0101: display=7'b0010010;
4'b0110: display=7'b0000010;
4'b0111: display=7'b1111000;
4'b1000: display=7'b0000000;
4'b1001: display=7'b0010000;
default display = 7'b1111111;
endcase
end
endmodule