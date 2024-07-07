module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
	
    localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [1:0] current_state,next_state;
    // State transition logic (combinational)
    always @(*) begin
        case(current_state)
            s0: next_state <= (in[3])?s1:s0;
            s1: next_state <= s2;
            s2: next_state <= s3;
            s3: next_state <= (in[3])?s1:s0;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) current_state <= s0;
        else current_state <= next_state;
    end
    // Output logic
    assign done = (current_state == s3)?1'b1:1'b0;

endmodule
