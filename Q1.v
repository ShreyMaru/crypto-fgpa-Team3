module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum  = cin ^ ( a^ b);
    assign cout = (cin &(a^b)) | (a&b);
    
endmodule