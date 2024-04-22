module bai4 (SW, LEDR);
input [11:10]SW;
output [5:1]LEDR;
reg [5:1]LEDR;
always @ (posedge SW[10] or negedge SW[11])
begin
	if (SW[11] == 1'b0)
	LEDR <= 5'b00000;
else 
begin
	LEDR <= LEDR + 1;
	if (LEDR == 5'b11000)
	LEDR <= 5'b00000;
	end
end
endmodule