module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always @(posedge clk) begin
        if (a) q <= 4'd4;
        else begin
            q <= (q < 4'd6) ? q + 1'b1 : 4'd0;
        end
    end

endmodule
