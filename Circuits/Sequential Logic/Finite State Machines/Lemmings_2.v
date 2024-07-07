module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    localparam left = 2'b00, right = 2'b01, fall_left = 2'b10, fall_right = 2'b11;
    reg [1:0] current_state, next_state;
    
    always @(*) begin
        case(current_state)
            left: next_state <= (ground==1'b0)?fall_left:((bump_left)?right:left);
            right: next_state <= (ground==1'b0)?fall_right:((bump_right)?left:right);
            fall_left: next_state <= (ground)?left:fall_left;
            fall_right: next_state <= (ground)?right:fall_right;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) current_state <= left;
        else current_state <= next_state;
    end
    
    assign walk_left = (current_state == left)?1'b1:1'b0;
    assign walk_right = (current_state == right)?1'b1:1'b0;
    assign aaah = (current_state == fall_left | current_state == fall_right)?1'b1:1'b0;

endmodule
