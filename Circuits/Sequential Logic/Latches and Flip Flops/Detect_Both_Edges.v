module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] one_delay;
    reg [7:0] two_delay;

    always @(posedge clk) begin
        one_delay <= in;
        two_delay <= one_delay;
    end
    
    assign anyedge[7] = (one_delay[7] & ~two_delay[7]) | (~one_delay[7] & two_delay[7]);  
    assign anyedge[6] = (one_delay[6] & ~two_delay[6]) | (~one_delay[6] & two_delay[6]);
    assign anyedge[5] = (one_delay[5] & ~two_delay[5]) | (~one_delay[5] & two_delay[5]);
    assign anyedge[4] = (one_delay[4] & ~two_delay[4]) | (~one_delay[4] & two_delay[4]);
    assign anyedge[3] = (one_delay[3] & ~two_delay[3]) | (~one_delay[3] & two_delay[3]);
    assign anyedge[2] = (one_delay[2] & ~two_delay[2]) | (~one_delay[2] & two_delay[2]);
    assign anyedge[1] = (one_delay[1] & ~two_delay[1]) | (~one_delay[1] & two_delay[1]);
    assign anyedge[0] = (one_delay[0] & ~two_delay[0]) | (~one_delay[0] & two_delay[0]);

endmodule
