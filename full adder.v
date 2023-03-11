`timescale 1ns / 1ps

module adder(s,cy,A,B,C);

  input A,B,C;
  output s,cy;
  
assign s= A ^ B ^ C;
assign cy= (A&B)|(B&C)|(A&C);

endmodule
