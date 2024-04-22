module fsm_VD1 (SW,LEDR);
parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
parameter s5 = 3'b101;
input [2:0]SW;
output [12:12]LEDR;
reg [2:0]current_state, next_state;
reg [12:12]LEDR;
always @ (*)
begin
 case (current_state) 
 s0 : if (SW[0]) next_state = s1; 
 else next_state = current_state;   
 s1 :  if (SW[0]) next_state = s2;    
 else next_state = current_state; 
 s2 :  if (SW[0]) next_state = s3; 
 else next_state = current_state;    
 s3 :  if (SW[0]) next_state = s4;      
 else next_state = current_state;  
 s4 :  if (SW[0]) next_state = s5;       
 else next_state = current_state;   
 s5 :  if (SW[0]) next_state = s0;      
 else next_state = current_state; 
 default next_state = s0; 
 endcase 
 end
 
 //CK = SW[2]; RS = SW[1]
 always @ (posedge SW[2]) 
 begin    
 if (SW[1] == 1) current_state <= s0;   
 else current_state <= next_state;
 end
 
 always @ (*)
 begin    
 if (current_state == s5) LEDR[12] = 1'b1;    
 else LEDR[12] = 1'b0; 
 end 
 endmodule 