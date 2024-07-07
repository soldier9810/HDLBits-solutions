module top_module (
    input clk,
    input reset,
    output reg [9:0] q);
    
    always @(posedge clk) begin
        if (reset) q <= 0;
        else begin
            if (q <= 10'd998) q = q + 1'b1;
            else q = 0;            
        end
    end
    
endmodule
