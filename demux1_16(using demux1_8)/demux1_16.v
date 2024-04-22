//demux1_16
module demux1_16(LEDR,SW);
input [4:0]SW;
output [15:0]LEDR;
wire notE;
not (notE, SW[3]);
demux1_8(LEDR[15:8],SW[2:0],SW[3],SW[4]);
demux1_8(LEDR[7:0],SW[2:0],notE,SW[4]);
endmodule

//demux1_8 dung 1_4 co ngo vao va cho phep tich cuc muc cao
module demux1_8(out,s,E,D);
input D,E; 
input [2:0]s; 
output [7:0]out; 
wire notE; 
not(notE,E); 
demux1_4 u1(out[3:0],E,s[1:0],D); 
demux1_4 u2(out[7:4],notE,s[1:0],D); 
endmodule 
//modul con 
module demux1_4(Y,E,S,D); 
input [1:0]S; //ngo vao chon 
input D; //ngo vao du lieu 
input E; //ngo vao cho phep 
output [3:0]Y ; // ngo ra tin hieu 
assign Y[0] = S[1]& S[0]& D & E; 
assign Y[1] = S[1]& ~S[0]& D & E; 
assign Y[2] = ~S[1]& S[0]& D & E; 
assign Y[3] = ~S[1]& ~S[0]& D & E; 
endmodule 
