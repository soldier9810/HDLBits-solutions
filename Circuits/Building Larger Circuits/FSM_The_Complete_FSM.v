module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    localparam s1=4'd0, s2=4'd1, s3=4'd2, s4=4'd3, b0=4'd4, b1=4'd5, b2=4'd6, b3=4'd7, Count=4'd8, Wait=4'd9;
    reg [3:0] current_state, next_state;
    
    always @(posedge clk) begin
        if (reset) current_state <= s1;
        else current_state <= next_state;
    end
    
    always @(*) begin
        case (current_state)
            s1: next_state = (data)?s2:s1;
            s2: next_state = (data)?s3:s1;
            s3: next_state = (data)?s3:s4;
            s4: next_state = (data)?b0:s1;
            b0: next_state = b1;
            b1: next_state = b2;
            b2: next_state = b3;
            b3: next_state = Count;
            Count: next_state = (done_counting == 1'b0)?Count:Wait;
            Wait: next_state = (ack)?s1:Wait;
        endcase
    end
    
    assign shift_ena = (current_state == b0 | current_state == b1 | current_state == b2 | current_state == b3)?1'b1:1'b0;
    assign counting = (current_state == Count)?1'b1:1'b0;
    assign done = (current_state == Wait)?1'b1:1'b0;

endmodule
