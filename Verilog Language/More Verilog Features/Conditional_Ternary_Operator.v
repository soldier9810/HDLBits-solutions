module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] one,two;
    assign one = (a>=b)?b:a;
    assign two = (c>=d)?d:c;
    assign min = (one>=two)?two:one;

endmodule
