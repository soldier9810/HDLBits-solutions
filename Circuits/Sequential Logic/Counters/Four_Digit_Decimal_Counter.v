module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena = {q[7:4]==4'd9 & q[3:0]==4'd9 & q[11:8]==4'd9, q[7:4]==4'd9 & q[3:0]==4'd9,q[3:0]==4'd9};
    
    decade d1(clk, reset, 1'b1, q[3:0]);
    decade d2(clk, reset, ena[1], q[7:4]);
    decade d3(clk, reset, ena[2], q[11:8]);
    decade d4(clk, reset, ena[3], q[15:12]);
    
endmodule

module decade(
	input clk,
    input reset,
    input enable,
    output [3:0] count
);
    always @(posedge clk) begin
        if (reset) count <= 0;
        else begin
            if (enable) count <= (count<4'd9)?count + 1'b1:4'b0;
        end
    end
endmodule