//module top 
module decoder3_8 (LEDR,SW); 
input [2:0]SW; 
output [7:0]LEDR; 
wire notc; 
not (notc, SW[2]); 
decoder2_4 u1(LEDR[3:0],SW[2],SW[1:0]); 
decoder2_4 u2(LEDR[7:4],notc,SW[1:0]); 
endmodule 


//module con decoder2-4 
module decoder2_4(y,e,x); 
input [1:0]x; // ngo vao tin hieu
input e; // ngo vao cho phep 
output [3:0]y; //ngo ra tin hieu 
 assign y[0] = e | x[1] | x[0]; 
 assign y[1] = e | x[1] | ~x[0]; 
 assign y[2] = e | ~x[1] | x[0]; 
 assign y[3] = e | ~x[1] | ~x[0]; 
endmodule