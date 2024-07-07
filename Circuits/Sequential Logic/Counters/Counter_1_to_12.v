module top_module (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    
    always @(posedge clk) begin
        if (reset) Q <= 4'b0001;
        else begin
            if (enable) begin
                if (Q < 4'd12) Q <= Q + 1'b1;
                else Q <= 4'd1;
            end
            else Q <= Q;
        end
    end
	assign c_enable = enable;
    assign c_load = (reset | ((Q == 4'd12) & enable));
    assign c_d = c_load ? 1'b1 : 1'b0;
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

endmodule
