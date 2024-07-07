module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    wire cout;
    wire ignored;
    add16 lb(a[15:0],b[15:0],1'b0, sum[15:0],cout);
    add16 ub(a[31:16],b[31:16],cout,sum[31:16],ignored);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign {cout,sum} = a + b + cin;
// Full adder module here

endmodule
