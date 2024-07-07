module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    reg [2:0] next_state;
    
    always @(*) begin
        case(y)
            3'b000: next_state <= (x)?3'b001:3'b000;
            3'b001: next_state <= (x)?3'b100:3'b001;
            3'b010: next_state <= (x)?3'b001:3'b010;
            3'b011: next_state <= (x)?3'b010:3'b001;
            3'b100: next_state <= (x)?3'b100:3'b011;
            default: next_state <= 3'b000;
        endcase
    end
    
    assign z = (y == 3'b011 | y == 3'b100)?1'b1:1'b0;
    assign Y0 = next_state[0];

endmodule
