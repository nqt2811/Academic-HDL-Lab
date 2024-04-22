//mach cong 8 bit dung mach cong 1 bit (fa)
module bai2(SW, LEDR); 
input [15:0]SW; 
output [8:0]LEDR; 
wire [7:0]a,b; 
wire [8:0]s; 
wire n1, n2, n3, n4, n5, n6, n7;
assign a=SW[7:0]; 
assign b=SW[15:8]; 
assign LEDR=s; 
fa (n1,s[0],a[0],b[0],1'b0); 
fa (n2,s[1],a[1],b[1],n1); 
fa (n3,s[2],a[2],b[2],n2); 
fa (n4,s[3],a[3],b[3],n3); 
fa (n5,s[4],a[4],b[4],n4); 
fa (n6,s[5],a[5],b[5],n5); 
fa (n7,s[6],a[6],b[6],n6); 
fa (s[8],s[7],a[7],b[7],n7); 
endmodule 
// mach cong 1 bit (fa) 
module fa(co,s,a,b,ci); 
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