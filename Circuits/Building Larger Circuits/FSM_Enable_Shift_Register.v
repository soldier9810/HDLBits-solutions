module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [2:0] counter;
    
    always @(posedge clk) begin
        if (reset) counter <=0;
        else begin
            if (counter < 3'd4) begin
                counter <= counter + 1'b1;
            end
            else counter <= counter;
        end
    end
    
    assign shift_ena = (counter < 3'd4)?1'b1:1'b0;

endmodule
