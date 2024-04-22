module ss1bit (LEDR,SW); 
 input [1:0]SW; 
 output [2:0]LEDR; 
 assign LEDR[0] = ~SW[0] & SW[1]; 
 assign LEDR[1] = SW[0] ~^ SW[1]; 
 assign LEDR[2]= SW[0] & ~SW[1]; 
endmodule 
