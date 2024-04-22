module ss2bit(SW, LEDR);
input [4:0]SW;
output [3:1]LEDR;
wire x,y,z,i,j;
sosanh_1bit a(z,y,x,SW[4],SW[3],SW[0]);
sosanh_1bit b(i,LEDR[2],j,SW[2],SW[1],y);
or OR1(LEDR[1],x,j);
or OR2(LEDR[3],z,i);
endmodule

module sosanh_1bit (y0,y1,y2,A,B,E); 
input A,B,E;
output y0,y1,y2;
	assign y0 =  ~A & B & E;
	assign y1 =  (A ~^ B) & E;
	assign y2 =  A & ~B & E;
endmodule