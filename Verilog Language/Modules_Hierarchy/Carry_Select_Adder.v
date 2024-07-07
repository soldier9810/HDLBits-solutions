module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire first_cout;
    wire [15:0] option1,option2;
    add16 first(.a(a[15:0]),
                .b(b[15:0]),
                .cin(1'b0),
                .sum(sum[15:0]),
                .cout(first_cout)
               );
    add16 second(.a(a[31:16]),
                 .b(b[31:16]),
                 .cin(1'b0),
                 .sum(option1),
                 .cout(1'b0)
               );
    add16 third(.a(a[31:16]),
                 .b(b[31:16]),
                .cin(1'b1),
                .sum(option2),
                 .cout(1'b0)
               );
    assign sum[31:16] = first_cout?option2:option1;

endmodule
