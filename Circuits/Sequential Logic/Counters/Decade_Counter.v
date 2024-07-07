module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
	
    always @(posedge clk) begin
        q = reset? 4'b0000 : (q>=4'b1001 ? 4'b0000 : q + 4'b0001);
    end
endmodule
