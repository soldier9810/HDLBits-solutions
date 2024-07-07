module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );
    
    localparam left = 3'b000, right = 3'b001, fall_left = 3'b010, fall_right = 3'b011, dig_left = 3'b100, dig_right = 3'b101;
    reg [2:0] current_state, next_state;
    
    always @(*) begin
        case(current_state)
            left: next_state <= (ground==1'b0) ? fall_left: ((dig)? dig_left : ((bump_left)?right:left));
            right: next_state <= (ground==1'b0) ? fall_right: ((dig)? dig_right : ((bump_right)?left:right));
            fall_left: next_state <= (ground)?left:fall_left;
            fall_right: next_state <= (ground)?right:fall_right;
            dig_left: next_state <= (ground)?dig_left:fall_left;
            dig_right: next_state <= (ground)?dig_right:fall_right;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) current_state <= left;
        else current_state <= next_state;
    end
    
    assign walk_left = (current_state == left)?1'b1:1'b0;
    assign walk_right = (current_state == right)?1'b1:1'b0;
    assign aaah = (current_state == fall_left | current_state == fall_right)?1'b1:1'b0;
    assign digging = (current_state == dig_left | current_state == dig_right)?1'b1:1'b0;

endmodule
