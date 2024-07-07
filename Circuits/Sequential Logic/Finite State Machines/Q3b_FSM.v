module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);    
    reg [2:0] current_state, next_state;
    
    always @(*) begin
        case(current_state)
            3'b000: next_state <= (x)?3'b001:3'b000;
            3'b001: next_state <= (x)?3'b100:3'b001;
            3'b010: next_state <= (x)?3'b001:3'b010;
            3'b011: next_state <= (x)?3'b010:3'b001;
            3'b100: next_state <= (x)?3'b100:3'b011;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) current_state <= 3'b0;
        else current_state <= next_state;
    end
    
    assign z = (current_state == 3'b011 | current_state == 3'b100)?1'b1:1'b0;

endmodule
