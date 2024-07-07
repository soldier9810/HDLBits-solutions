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
	
    localparam left = 3'b000, right = 3'b001, fall_left = 3'b010, fall_right = 3'b011, dig_left = 3'b100, dig_right = 3'b101, splatter = 3'b110;
    localparam thresh_pass = 3'b111;
    reg [2:0] current_state, next_state;
    reg [4:0] count;
    
    always @(*) begin
        case(current_state)
            left: next_state <= (ground==1'b0) ? fall_left: ((dig)? dig_left : ((bump_left)?right:left));
            right: next_state <= (ground==1'b0) ? fall_right: ((dig)? dig_right : ((bump_right)?left:right));
            fall_left: next_state <= (ground)?left:(count < 5'd20)?fall_left:thresh_pass;
            fall_right: next_state <= (ground)?right:(count < 5'd20)?fall_right:thresh_pass;
            dig_left: next_state <= (ground)?dig_left:fall_left;
            dig_right: next_state <= (ground)?dig_right:fall_right;
            thresh_pass: next_state <= (ground)?splatter:thresh_pass;
            splatter: next_state <= splatter;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) begin 
            current_state <= left;
            count <= 0;
        end
        else begin
            current_state = next_state;
            case (current_state)
                left: count <= 5'd0;
                right: count <= 5'd0;
                dig_left: count <= 5'd0;
                dig_right: count <= 5'd0;
                fall_left: count <= count + 1'b1;
                fall_right: count <= count + 1'b1;
                default: count <= count;
            endcase
        end
    end
    
    assign walk_left = (current_state == left)?1'b1:1'b0;
    assign walk_right = (current_state == right)?1'b1:1'b0;
    assign aaah = (current_state == fall_left | current_state == fall_right | current_state == thresh_pass)?1'b1:1'b0;
    assign digging = (current_state == dig_left | current_state == dig_right)?1'b1:1'b0;

endmodule
