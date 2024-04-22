// mạch nhân 3 bit
module machnhan3bit (SW, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0); 
input [11:0] SW; 
output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
wire [2:0] A, B;
wire [5:0] P;  
wire [2:1] C_b1;    
wire [4:2] PP1;   
wire [2:1] C_b2;       
wire [2:1] C_b3; 

assign A = SW[11:9];  
assign B = SW[8:6];  
assign P[0] = A[0] & B[0];

// module t (a, b, ci, s, co)
t1 b1_a0 (A[1] & B[0], A[0] & B[1], 1'b0,    P[1],   C_b1[1]);  
t1 b1_a1 (A[2] & B[0], A[1] & B[1], C_b1[1], PP1[2], C_b1[2]); 
t1 b1_a2 (1'b0,  A[2] & B[1], C_b1[2], PP1[3], PP1[4]);

// module t (a, b, ci, s, co);  
t1 b2_a0 (PP1[2], A[0] & B[2], 1'b0,    P[2],   C_b2[1]);  
t1 b2_a1 (PP1[3], A[1] & B[2], C_b2[1], P[3], C_b2[2]);  
t1 b2_a2 (PP1[4], A[2] & B[2], C_b2[2], P[4], P[5]); 
 

hex7seg digit_7 (4'h0, HEX7);  
hex7seg digit_6 (A, HEX6); 
hex7seg digit_5 (4'h0, HEX5);  
hex7seg digit_4 (B, HEX4)
hex7seg digit_3 (4'h0, HEX3);  
hex7seg digit_2 (4'h0, HEX2);  
hex7seg digit_1 (P[5:3], HEX1);  
hex7seg digit_0 (P[2:0], HEX0);
endmodule

module t1 (a, b, ci, s, co);  
input a, b, ci;  
output s, co;  
wire a_xor_b; 
 
assign a_xor_b = a ^ b;  
assign s = a_xor_b ^ ci;  
assign co = (~a_xor_b & b) | (a_xor_b & ci); 
endmodule

module hex7seg (hex, display);  
input [3:0] hex;  
output [0:6] display;  
reg [0:6] display; 
 
always @ (hex)   
case (hex)    
3'h0: display = 7'b0000001;    
3'h1: display = 7'b1001111;    
3'h2: display = 7'b0010010;    
3'h3: display = 7'b0000110;    
3'h4: display = 7'b1001100;    
3'h5: display = 7'b0100100;    
3'h6: display = 7'b1100000;    
3'h7: display = 7'b0001111;    
3'h8: display = 7'b0000000;    
3'h9: display = 7'b0001100;    
3'hA: display = 7'b0001000;    
3'hb: display = 7'b1100000;    
3'hC: display = 7'b0110001;    
3'hd: display = 7'b1000010;    
3'hE: display = 7'b0110000;    
3'hF: display = 7'b0111000;   
endcase 
endmodule 