module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    localparam idle = 0, start = 1, b0 = 2, b1 = 3, b2 = 4, b3 = 5, b4 = 6, b5 = 7, b6 = 8, b7 = 9, stop = 10, WAIT = 11;
    
    reg [3:0] current_state, next_state;
    
    always @(*) begin
        case(current_state)
            idle: next_state <= (in==1'b0)?start:idle;
            start: next_state <= b0;
            b0: next_state <= b1;
            b1: next_state <= b2;
            b2: next_state <= b3;
            b3: next_state <= b4;
            b4: next_state <= b5;
            b5: next_state <= b6;
            b6: next_state <= b7;
            b7: next_state <= (in)?stop:WAIT;
            WAIT: next_state <= (in)?idle:WAIT;
            stop: next_state <= (in==1'b0)?start:idle;
            
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) current_state <= idle;
        else current_state <= next_state;
    end
    
    assign done = (current_state == stop)?1'b1:1'b0;

endmodule
