module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    
    reg [23:0] temp;
    
    // FSM from fsm_ps2
	localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [1:0] current_state,next_state;
    // State transition logic (combinational)
    always @(*) begin
        case(current_state)
            s0: begin
                next_state <= (in[3])?s1:s0;
            end
            s1: begin
                next_state <= s2;
            end
            s2: begin 
                next_state <= s3;
            end
            s3: next_state <= (in[3])?s1:s0;
        endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) current_state = s0;
        else begin
            current_state <= next_state;
            temp <= {temp[15:8], temp[7:0], in};
        end
        
    end
    // Output logic
    assign done = (current_state == s3)?1'b1:1'b0;

    // New: Datapath to store incoming bytes.
    assign out_bytes = (done)?temp:{24{1'bx}};

endmodule
