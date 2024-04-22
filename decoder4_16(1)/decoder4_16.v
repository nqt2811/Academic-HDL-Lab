//4_16 dung 3_8 E tich cuc thap, Y tich cuc thap..
module decoder4_16(LEDR,SW); 
input [3:0]SW; 
output [15:0]LEDR;
wire notc;
not (notc, SW[3]);
decoder3_8 d1(LEDR[15:8],SW[2:0]);
decoder3_8 d2(LEDR[7:0],SW[2:0]);
endmodule

//module con3_8
module decoder3_8 (out,in); 
input [2:0]in; 
output [7:0]out; 
wire notc; 
not (notc, in[2]); 
decoder2_4 u1(out[3:0],in[2],in[1:0]); 
decoder2_4 u2(out[7:4],notc,in[1:0]); 
endmodule 


//module con decoder2-4 
module decoder2_4(y,e,x); 
input [1:0]x; // ngo vao tin hieu
input e; // ngo vao cho phep 
output [3:0]y; //ngo ra tin hieu 
 assign y[0] = ~e | x[1] | x[0]; 
 assign y[1] = ~e | x[1] | ~x[0]; 
 assign y[2] = ~e | ~x[1] | x[0]; 
 assign y[3] = ~e | ~x[1] | ~x[0]; 
endmodule
