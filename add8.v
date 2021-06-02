module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum  = cin ^ ( a^ b);
    assign cout = (cin &(a^b)) | (a&b);
    
endmodule

module top_module(input [7:0] a,input [7:0] b, output [7:0] sum, output cout);
    wire x1,x2,x3,x4,x5,x6,x7;
    add1 d1(a[0],b[0],1'b0,sum[0],x1);
    add1 d2(a[1],b[1],x1,sum[1],x2);
    add1 d3(a[2],b[2],x2,sum[2],x3);
    add1 d4(a[3],b[3],x3,sum[3],x4);
    add1 d5(a[4],b[4],x4,sum[4],x5);
    add1 d6(a[5],b[5],x5,sum[5],x6);
    add1 d7(a[6],b[6],x6,sum[6],x7);
    add1 d8(a[7],b[7],x7,sum[7],cout);
    
endmodule

module test;
    reg [7:0] A,B;
    wire D;
    wire [7:0] C;
    
    
    top_module dut(.a(A), .b(B), .sum(C), .cout(D) );
    initial begin
           A = 8'b00101010 ; B = 8'b00000001;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b00101001 ; B = 8'b00000001;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b10101001 ; B = 8'b11000001;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b00101010 ; B = 8'b10100001;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b00101001 ; B = 8'b00110001;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b11101001 ; B = 8'b01111101;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b00100001 ; B = 8'b00000000;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b10101001 ; B = 8'b10101001;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b11011001 ; B = 8'b00101000;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);

        #1 A = 8'b11111111 ; B = 8'b11111111;
        #1 $display ("A = %b , B = %b , SUM = %b, CARRY = %b" , A,B,C,D);
        
        $stop;
    end
endmodule
