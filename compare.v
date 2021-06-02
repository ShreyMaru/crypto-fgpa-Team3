module com1 ( input a, input b, output greater,   output less, output equal );
    assign greater = a & (~b);
    assign less = (~a) & b;
    assign equal = (a&b) | ((~a) & (~b)) ;
    
endmodule

module top_module(input [7:0] a,input [7:0] b,output greater,   output less, output equal  );
    wire a0,a1,a2,a3,a4,a5,a6,a7;
    wire b0,b1,b2,b3,b4,b5,b6,b7;
    wire x;
    com1 c7(a[7],b[7],a7,x,b7);
    com1 c6(a[6],b[6],a6,x,b6);
    com1 c5(a[5],b[5],a5,x,b5);
    com1 c4(a[4],b[4],a4,x,b4);
    com1 c3(a[3],b[3],a3,x,b3);
    com1 c2(a[2],b[2],a2,x,b2);
    com1 c1(a[1],b[1],a1,x,b1);
    com1 c0(a[0],b[0],a0,x,b0);
    
    assign greater = (a7)|(b7&a6)|(b7&b6&a5)|(b7&b6&b5&a4)|(b7&b6&b5&b4&a3)|(b7&b6&b5&b4&b3&a2)|(b7&b6&b5&b4&b3&b2&a1)|(b7&b6&b5&b4&b3&b2&b1&a0);
    assign equal =   b7 & b6 & b5 & b4 & b3 & b2 & b1 & b0;
    assign less = !(greater ^ equal);  
endmodule

module test;
    reg [7:0] A,B;
    wire g,e,l;
    
    
    
    top_module dut(.a(A), .b(B), .greater(g), .less(l), .equal(e) );
    initial begin
        A = 8'b00101010 ; B = 8'b00000001;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b00101001 ; B = 8'b10000000;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b10101001 ; B = 8'b11000001;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b00101010 ; B = 8'b10100001;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b00101001 ; B = 8'b00110001;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b11101001 ; B = 8'b01111101;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b00100001 ; B = 8'b00000000;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b10101001 ; B = 8'b10101001;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b11011001 ; B = 8'b00101000;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);

        #1 A = 8'b11111111 ; B = 8'b11111111;
        #1 $display ("A = %b , B = %b , greater = %b, equal = %b, less = %b" , A,B,g,e,l);
        
        $stop;
    end
endmodule

    