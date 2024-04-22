// Bai_10 trang108
module nhap (SW,CLOCK_50, LEDR, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
input [0:0]SW;
input CLOCK_50;
output reg [6:0]HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
output reg [17:0]LEDR;

parameter s0  = 4'b0000;
parameter s1  = 4'b0001;
parameter s2  = 4'b0010;
parameter s3  = 4'b0011;
parameter s4  = 4'b0100;
parameter s5  = 4'b0101;
parameter s6  = 4'b0110;
parameter s7  = 4'b0111;
parameter s8  = 4'b1000;
parameter s  = 4'b1001;
parameter h  = 4'b1010;
parameter h0  = 4'b1011;

reg [3:0] cs, ns;
reg [3:0]current_state, next_state;


integer q;
reg clock_1s = 1'b0;
always @ (posedge CLOCK_50)
	begin
		q=q+1;
		if (q == 27777777)   
		begin     
		clock_1s = ~clock_1s;   
		q = 0;   
		end   
	end  

integer p;
reg clock_2s = 1'b0;
always @ (posedge CLOCK_50)
	begin
		p=p+1;
		if (p == 50000000)   
		begin     
		clock_2s = ~clock_2s;   
		p = 0;   
		end   
	end  
	
	always @(*)
	begin
	case (cs)
	h: ns = h0;
	h0: ns = h;
	default ns = h;
	endcase
	end
	
always @ (*) 
	begin  
		case (current_state) 
		s :  next_state = s0;
		s0 :  next_state = s1;  
		s1 :  next_state = s2;  
		s2 :  next_state = s3;  
		s3 :  next_state = s4; 
		s4 :  next_state = s5;  
		s5 :  next_state = s6;
		s6 :  next_state = s7;
		s7 :  next_state = s8;
		s8 :  next_state = s;
		default next_state = s;  
		endcase 
	end 	

	
	
always @ (posedge clock_1s or posedge SW[0])
	begin 
		if (SW[0]) current_state <= s; 
		else current_state <= next_state;
	end
	
always @ (posedge clock_2s or posedge SW[0])
	begin 
		if (SW[0]) cs <= h0;
		else cs <= ns;
end


always @ (*)
	begin 
		case (current_state) 
		s: LEDR[17:0] = 18'b000000000000000000;
		s0: LEDR[17:0] = 18'b100000000000000001;
		s1: LEDR[17:0] = 18'b110000000000000011;
		s2: LEDR[17:0] = 18'b111000000000000111;
		s3: LEDR[17:0] = 18'b111100000000001111;
		s4: LEDR[17:0] = 18'b111110000000011111;
		s5: LEDR[17:0] = 18'b111111000000111111;
		s6: LEDR[17:0] = 18'b111111100001111111;
		s7: LEDR[17:0] = 18'b111111110011111111;
		s8: LEDR[17:0] = 18'b111111111111111111;
		endcase 
	end 


always @ (*) 
	begin  
		case (cs) 
		h:
		begin
			HEX7 = 7'b0100001; //D
			HEX6 = 7'b0000110; //E
			HEX5 = 7'b0100100; //2
			HEX4 = 7'b0111111; //-
			HEX3 = 7'b0001110; //F
			HEX2 = 7'b0001100; //P
			HEX1 = 7'b0000010; //G
			HEX0 = 7'b0001000; //A
		end
		h0:
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
		default ns = h0;  
		endcase 
	end 
endmodule

