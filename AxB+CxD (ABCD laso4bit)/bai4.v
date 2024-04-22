// P = (A.B) + (C.D)
module bai4(SW, LEDR,HEX0,HEX1,HEX2,HEX3); //CONG 4 BIT TU 1 BIT 
input [15:0]SW;
output[0:6]HEX0,HEX1,HEX2,HEX3;  
output [15:0]LEDR;  
wire [3:0]a,b,c,d; 
wire [7:0]p1,p2;
wire [16:0]s; 
wire n1;  
assign a=SW[3:0]; 
assign b=SW[7:4];
assign c=SW[11:8]; 
assign d=SW[15:12];
assign LEDR=s; 


multiplier(p1, a, b);
multiplier(p2, c, d);
FA8(p1,p2,1'b0,s[15:8],s[7:0]);

hex7seg digit_3 (4'h0, HEX3); 
hex7seg digit_2 (s[11:8], HEX2); 
hex7seg digit_1 (s[7:4], HEX1); 
hex7seg digit_0 (s[3:0], HEX0); 
endmodule 


module FA1(co,s,a,b,ci); 
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

module FA8(a, b, cin, cout, sum);

input [7:0] a;
input [7:0] b;
input cin;
output [7:0]sum;
output cout;
wire[6:0] c;
FA1 a1(c[0],sum[0],a[0],b[0],cin);
FA1 a2(c[1],sum[1],a[1],b[1],c[0]);
FA1 a3(c[2],sum[2],a[2],b[2],c[1]);
FA1 a4(c[3],sum[3],a[3],b[3],c[2]);
FA1 a5(c[4],sum[4],a[4],b[4],c[3]);
FA1 a6(c[5],sum[5],a[5],b[5],c[4]);
FA1 a7(c[6],sum[6],a[6],b[6],c[5]);
FA1 a8(cout,sum[7],a[7],b[7],c[6]);

endmodule

module Node1(HCout, VCout, A, B, HCin, VCin);
input A, B, HCin, VCin;
output HCout, VCout;
wire W1;
    
assign W1 = A&B;
FA1 fa1(HCout, VCout, W1, VCin, HCin);
endmodule 
 
module multiplier(p, a, b);
input [3:0] a, b;
output [7:0] p;
wire [3:0] sum0, sum1, sum2, sum3, sum4, sum5, sum6;
wire [3:0] c0, c1, c2, c3, c4, c5, c6;
    
    // First row
Node1 node0(c0[0], sum0[0], a[0], b[0], 0, 0);
Node1 node1(c1[0], sum1[0], a[1], b[0], c0[0], 0);
Node1 node2(c2[0], sum2[0], a[2], b[0], c1[0], 0);
Node1 node3(c3[0], sum3[0], a[3], b[0], c2[0], 0);
    // Second row
Node1 node4(c1[1], sum1[1], a[0], b[1], 0, sum1[0]);
Node1 node5(c2[1], sum2[1], a[1], b[1], c1[1], sum2[0]);
Node1 node6(c3[1], sum3[1], a[2], b[1], c2[1], sum3[0]);
Node1 node7(c4[1], sum4[1], a[3], b[1], c3[1], c3[0]);
    // Third row
Node1 node8(c2[2], sum2[2], a[0], b[2], 0, sum2[1]);
Node1 node9(c3[2], sum3[2], a[1], b[2], c2[2], sum3[1]);
Node1 node10(c4[2], sum4[2], a[2], b[2], c3[2], sum4[1]);
Node1 node11(c5[2], sum5[2], a[3], b[2], c4[2], c4[1]);
    // Forth row
Node1 node12(c3[3], sum3[3], a[0], b[3], 0, sum3[2]);
Node1 node13(c4[3], sum4[3], a[1], b[3], c3[3], sum4[2]);
Node1 node14(c5[3], sum5[3], a[2], b[3], c4[3], sum5[2]);
Node1 node15(c6[3], sum6[3], a[3], b[3], c5[3], c5[2]);
    
assign p[0] = sum0[0];
assign p[1] = sum1[1];
assign p[2] = sum2[2];
assign p[3] = sum3[3];
assign p[4] = sum4[3];
assign p[5] = sum5[3];
assign p[6] = sum6[3];
assign p[7] = c6[3];
endmodule

module hex7seg (hex, display); 
input [3:0] hex; 
output [0:6] display; 
reg [0:6] display; 
always @ (hex) 
case (hex) 
4'h0: display = 7'b0000001; 
4'h1: display = 7'b1001111; 
4'h2: display = 7'b0010010; 
4'h3: display = 7'b0000110; 
4'h4: display = 7'b1001100; 
4'h5: display = 7'b0100100; 
4'h6: display = 7'b1100000; 
4'h7: display = 7'b0001111; 
4'h8: display = 7'b0000000;
4'h9: display = 7'b0001100;    
4'hA: display = 7'b0001000;    
4'hb: display = 7'b1100000;    
4'hC: display = 7'b0110001;    
4'hd: display = 7'b1000010;    
4'hE: display = 7'b0110000;    
4'hF: display = 7'b0111000;   
endcase 
endmodule
