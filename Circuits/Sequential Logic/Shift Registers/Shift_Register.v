module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);
	
    reg q1, q2, q3;
    
    always @(posedge clk) begin
        if (~resetn) {out,q3,q2,q1} <= 4'b0;
        else begin
            q1 <= in;
            q2 <= q1;
            q3 <= q2;
            out <= q3;
        end
    end

endmodule
