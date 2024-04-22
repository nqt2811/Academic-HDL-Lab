//demux1_8 dung 1_4 co ngo vao va cho phep tich cuc muc cao
module demux1_8(LEDR,SW); 
input [3:0]SW; 
output [7:0]LEDR; 
wire notS2; 
not(notS2,SW[3]); //notS2=~SW[3] 
demux1_4 u1(LEDR[3:0],SW[3],SW[2:1],SW[0]); 
demux1_4 u2(LEDR[7:4],notS2,SW[2:1],SW[0]); 
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
