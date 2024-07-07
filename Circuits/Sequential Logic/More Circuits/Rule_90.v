module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q );
    
    integer i;
    
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            for (i = 1 ; i < 511 ; i = i + 1) begin
                q[0] <= 1'b0 ^ q[1];
                q[511] <= 1'b0 ^ q[510];
                q[i] <= q[i-1'b1]^q[i+1'b1];
            end
        end
    end

endmodule
