module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (b&d)|(a&d)|(a&c)|(b&c);

endmodule
