module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);
	
    always @(posedge clk) begin
        q = reset?0:((q>=4'b1111)?0:q+4'b0001);
    end
    
        
endmodule
