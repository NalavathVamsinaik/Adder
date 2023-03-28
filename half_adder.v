`timescale 1ns / 1ps



module half_adder(
input a,b,
output sum,carry
    );
    
    assign sum= a ^ b;
    assign carry = a & b;
endmodule

// test bench 

`timescale 1ns / 1ps



module half_adder_tb;

reg a;
reg b;
wire sum;
wire carry;

half_adder dut (.a(a), .b(b), .sum(sum), .carry(carry));

initial begin
    
    a=1'b0;
    b=1'b0;
   
   #50;
   
    a=1'b0;
    b=1'b1;
    
    #50;
    
    a=1'b1;
    b=1'b0;
    
    #50;
    
    a=1'b1;
    b=1'b1;
    
end 
       
endmodule

