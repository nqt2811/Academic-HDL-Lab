//viết code mô tả mạch đếm nhị phân 4 bit, mỗi trạng thái tồn tại trong 1s (T = 1s),
//chân RS đồng bộ, tích cực mức cao

module bai4 (CLOCK_50,LEDR,SW);
	input [0:0]SW;
	input CLOCK_50; 
	output [4:1]LEDR;
	integer q;
	reg [4:1]LEDR; 
	reg clock_1s = 1'b0;
// tao xung clock co f = 1hz	
	always @ (posedge CLOCK_50)
		begin
			q=q+1;
			if (q == 50000000) 
			begin 
				clock_1s = ~clock_1s;
				q = 0;
			end
		end
//counter 4bit
		always @ (posedge clock_1s)
		begin
			if (SW[0] == 1)
			LEDR = 4'b0000;
			else
			LEDR = LEDR + 1;
		end		
endmodule
