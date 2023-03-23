`timescale 1ns / 1ps


module RCA( x, y, cin, s );
      
      input [3:0]x,y;
      input cin=0;
      output [4:0]s;
      wire[3:1]c;
      
      FA B0 (cin, x[0], y[0], s[0], c[1]);
      FA B1 (c[1], x[1], y[1], s[1], c[2]);
      FA B2 (c[2], x[2], y[2], s[2], c[3]);
      FA B3 (c[3], x[3], y[3], s[3], s[4]);
      
endmodule

// full adder:

module FA( cin, x, y, s,cy);
 
    input x,y,cin;
    output s;
    output cy;
    
    assign s= x ^ y ^ cin;
    assign cy= (x&y)|(y&cin)|(x&cin);
 
 endmodule
 
// for sum:

module sum(s,x,y,cin);

     input x,y,cin;
     output s;
     wire t;
     
     xor g1(t,x,y);
     xor g2(s,t,cin);

endmodule

// for carry :

module carry(cin,x,y,c);

     input x,y,cin;
     output c;
     wire t1,t2,t3;
     
     and g1(t1,x,y);
     and g2(t2,x,y);
     and g3(t3,y,c);
     or  g4(c,t1,t2,t3);
 
endmodule


// 4-bit RCA testbench

`timescale 1ns / 1ps

module RCA_testbench( );

reg[3:0] x, y;
reg cin;
wire[4:0] s;

RCA dut ( .x(x), .y(y), .cin(cin), .s(s));

initial begin 
x=0; y=0; cin=0;
end

initial begin
#30
x=5; y=6;
#30
x=1; y=5;
#30
x=8; y=10;
#30
x=9; y=20;

$stop;

end 
endmodule


