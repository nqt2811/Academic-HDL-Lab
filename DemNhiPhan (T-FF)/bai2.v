module bai2(SW,LEDR);
input [2:0]SW;
output [3:0]LEDR;
wire a1,a2,a3;

t_ff T1(LEDR[0],SW[2],SW[0],SW[1]);
t_ff T2(LEDR[1],a1,SW[0],SW[1]);
t_ff T3(LEDR[2],a2,SW[0],SW[1]);
t_ff T4(LEDR[3],a3,SW[0],SW[1]);

and AND1(a1,SW[0],LEDR[0]);
and AND2(a2,a1,LEDR[1]);
and AND3(a3,a2,LEDR[2]);

endmodule

module t_ff(q, t, ck, rs);
input ck, t, rs;
output q;
reg q;
always @ (posedge ck or negedge rs)
begin
	if (rs == 1'b0)
		q <= 0;
	else
		if (t == 1'b0)
			q <= q; 
		else
			q <= !q;
end
endmodule 