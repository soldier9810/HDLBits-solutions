module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] one_delay;
    reg [7:0] two_delay;

    always @(posedge clk) begin
        one_delay <= in;
        two_delay <= one_delay;
    end
    
    assign pedge[7] = one_delay[7] & ~two_delay[7];  
    assign pedge[6] = one_delay[6] & ~two_delay[6];
    assign pedge[5] = one_delay[5] & ~two_delay[5];
    assign pedge[4] = one_delay[4] & ~two_delay[4];
    assign pedge[3] = one_delay[3] & ~two_delay[3];
    assign pedge[2] = one_delay[2] & ~two_delay[2];
    assign pedge[1] = one_delay[1] & ~two_delay[1];
    assign pedge[0] = one_delay[0] & ~two_delay[0];

endmodule
