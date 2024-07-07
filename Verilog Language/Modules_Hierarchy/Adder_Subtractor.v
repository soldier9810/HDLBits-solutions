module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] useless;
    assign useless = sub?~b:b;
    wire first_cout,final_cout;
    add16 first(a[15:0],useless[15:0],sub,sum[15:0],first_cout);
    add16 second(a[31:16],useless[31:16],first_cout,sum[31:16],final_cout);
endmodule
