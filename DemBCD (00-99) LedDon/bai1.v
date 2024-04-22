//dem BCD 00_99
module bai1 (KEY,SW,LEDR);
input [12:12]SW;  //rs	
input [3:3]KEY;  //ck
output [7:0]LEDR; 
reg [7:0]LEDR;
always @ (posedge KEY[3])
	begin
		if (SW[12] == 1)
			begin 
				LEDR[7:4] <= 4'b0000;
				LEDR[3:0] <= 4'b0000;
			end
			else
				begin LEDR[3:0] <= LEDR[3:0] + 1;
					if (LEDR[3:0] == 4'b1001)
						begin
							LEDR[3:0] <= 4'b0000;
							LEDR[7:4] <= LEDR[7:4] + 1;
							if (LEDR[7:4] == 4'b1001)
							LEDR[7:4] <= 4'b0000;
						end
				end
			end
endmodule 
 