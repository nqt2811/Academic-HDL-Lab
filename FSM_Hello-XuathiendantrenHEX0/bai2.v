//RESET: SW0,   CK: CLOCK_50,   Y: HEX0
module bai2 (SW,CLOCK_50,HEX0);
input [0:0]SW;
input CLOCK_50;
output reg [6:0]HEX0;
parameter s0  = 3'b000;
parameter s1  = 3'b001;
parameter s2  = 3'b010;
parameter s3  = 3'b011;
parameter s4  = 3'b100;

reg [2:0]current_state, next_state;
integer q;
reg clock_1s = 1'b0;
always @ (posedge CLOCK_50)
	begin
		q=q+1;
		if (q == 49999999)   
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
		s4 :  next_state = s0;       
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
		s0: HEX0 = 7'b0001001;
		s1: HEX0 = 7'b0000110; 
		s2: HEX0 = 7'b1000111; 
		s3: HEX0 = 7'b1000111;  
		s4: HEX0 = 7'b1000000;  

		endcase 
	end 
endmodule