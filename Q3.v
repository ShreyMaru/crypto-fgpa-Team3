module com1 ( input a, input b, output greater,   output less, output equal );
    assign greater = a & (~b);
    assign less = (~a) & b;
    assign equal = (a&b) | ((~a) & (~b)) ;
    
endmodule


    