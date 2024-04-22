module bai3 (SW,CLOCK_50,HEX3, HEX2, HEX1, HEX0);
input [0:0]SW;
input CLOCK_50;
output reg [6:0]HEX3, HEX2, HEX1, HEX0;
parameter s0  = 3'b000;
parameter s1  = 3'b001;
parameter s2  = 3'b010;
parameter s3  = 3'b011;
parameter s4  = 3'b100;
parameter s5  = 3'b101;
parameter s6  = 3'b110;
parameter s7  = 3'b111;
reg [2:0]current_state, next_state;

integer q;
reg clock_1s = 1'b0;
always @ (posedge CLOCK_50)
	begin
		q=q+1;
		if (q == 25000000)   
		begin     
		clock_1s = ~clock_1s;   
		q = 0;   
		end   
	end  
	
	//mach to hop tac dong ngo vao cho FF cua fsm 
	always @ (*) 
	begin  
		case (current_state)  
		s0 :  next_state = s1;  
		s1 :  next_state = s2;  
		s2 :  next_state = s3;  
		s3 :  next_state = s4; 
		s4 :  next_state = s5;  
		s5 :  next_state = s6;
		s6 :  next_state = s7;
		s7 :  next_state = s0;
		default next_state = s0;  
		endcase 
	end 
	
//mach tuan tu tao trang thai trong cho  fsm
always @ (posedge clock_1s or posedge SW[0])
	begin 
		if (SW[0]) current_state <= s0; 
		else current_state <= next_state;
	end

//mach to hop tac dong trang thai ngo ra fsm
always @ (*)
	begin 
		case (current_state) 
				s0:
		begin
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
		end
				s1:
		begin
			HEX3 = 7'b0001000; //A
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
		end
				s2:
		begin
			HEX3 = 7'b0000010; //G
			HEX2 = 7'b0001000; //A
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
		end
				s3:
		begin
			HEX3 = 7'b0001100; //P
			HEX2 = 7'b0000010; //G
			HEX1 = 7'b0001000; //A
			HEX0 = 7'b1111111;
		end
				s4:
		begin
			HEX3 = 7'b0001110; //F
			HEX2 = 7'b0001100; //P
			HEX1 = 7'b0000010; //G
			HEX0 = 7'b0001000; //A
		end
		s5:
		begin
			HEX3 = 7'b1111111;
			HEX2 = 7'b0001110; //F
			HEX1 = 7'b0001100; //P
			HEX0 = 7'b0000010; //G
		end
		s6:
		begin
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b0001110; //F
			HEX0 = 7'b0001100; //P
		end
		s7:
		begin
			HEX3 = 7'b1111111;
			HEX2 = 7'b1111111;
			HEX1 = 7'b1111111;
			HEX0 = 7'b0001110; //F
		end
		endcase 
	end 
endmodule


