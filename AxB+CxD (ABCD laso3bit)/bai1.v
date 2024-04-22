// P = (A.B) + (C.D)
// A, B, C, D -> 3 bit nhị phân
// Hiện kq ra HEX
//thuc hien bieu thuc AxB+CxD
module pheptinh(SW, HEX7,HEX6, HEX5, HEX4, HEX3, HEX2,HEX1,HEX0);
input [11:0]SW;
output [6:0] HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
wire [3:0]tram,tramchuc,chuc,donvi;
 wire [6:0]s;
 wire [2:0]A,B,C,D;
 wire [5:0]U,V;
 wire [6:0]P;
 assign A = SW[11:9];  
 assign B = SW[8:6];
 assign C = SW[5:3];
 assign D = SW[2:0]; 

 machnhan (A,B,U);
 machnhan (C,D,V);
 cong6bit (U,V,P,1'b0);
 
 bcd7seg digit_7 (A, HEX7); 
 bcd7seg digit_6 (B, HEX6); 
 bcd7seg digit_5 (C, HEX5); 
 bcd7seg digit_4 (D, HEX4);
 bcd7seg digit_3 (4'h0, HEX3); 
 //chuyen kieu reg sang kieu wire
 
assign tramchuc=P/10;
assign tram=tramchuc/10;
assign chuc=tramchuc%10;
assign donvi=P%10;
bcd7seg  digit_2(tram, HEX2);
bcd7seg  digit_1(chuc, HEX1);
bcd7seg  digit_0(donvi, HEX0);

endmodule


module machnhan (A,B,P); 
 input [2:0]A,B;
 output [5:0]P;
 wire [2:1]C2,C1;
 wire [4:2]PP1;
 assign P[0] = A[0] & B[0]; 
 // module cong1bit (a, b, ci, s, co); 
 cong1bit (A[1] & B[0], A[0] & B[1], 1'b0, P[1 ], C1[1]); 
 cong1bit (A[2] & B[0], A[1] & B[1], C1[1], PP1[2], C1[2]); 
 cong1bit (1'b0, A[2] & B[1], C1[2], PP1[3], PP1[4]); 
 
  // module cong1bit (a, b, ci, s, co); 
 cong1bit (PP1[2], A[0] & B[2], 1'b0, P[2], C2[1]); 
 cong1bit (PP1[3], A[1] & B[2], C2[1], P[3], C2[2]); 
 cong1bit (PP1[4], A[2] & B[2], C2[2], P[4], P[5]); 
endmodule


module cong1bit (a,b,ci,s,co); 
input a,b,ci; 
output co,s; 
wire n1,n2,n3,n4; 
xor (n1,a,b); 
xor (s,ci,n1); 
not (n2,n1); 
and (n3,n2,b); 
and (n4,ci,n1); 
or (co,n3,n4); 
endmodule 


module cong6bit(a,b,s,cin); 
input cin;
input [5:0]a,b; 
output [6:0]s; 
wire [6:0]s; 
wire n1,n2,n3,n4,n5; 
cong1bit (a[0],b[0],cin,s[0],n1); 
cong1bit (a[1],b[1],n1,s[1],n2); 
cong1bit (a[2],b[2],n2,s[2],n3); 
cong1bit (a[3],b[3],n3,s[3],n4); 
cong1bit (a[4],b[4],n4,s[4],n5);
cong1bit (a[5],b[5],n5,s[5],s[6]);
endmodule


module bcd7seg(bcd,display);
input [3:0]bcd;
output [6:0]display;
reg [6:0]display;
always@(bcd) begin
case(bcd)
4'b0000: display=7'b1000000;
4'b0001: display=7'b1111001;
4'b0010: display=7'b0100100;
4'b0011: display=7'b0110000;
4'b0100: display=7'b0011001;
4'b0101: display=7'b0010010;
4'b0110: display=7'b0000010;
4'b0111: display=7'b1111000;
4'b1000: display=7'b0000000;
4'b1001: display=7'b0010000;
default display = 7'b1111111;
endcase
end
endmodule
