module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    
    localparam A = 1'b0, B = 1'b1;
    
    reg current_state, next_state;
    reg [1:0] count_1s, timer;
    
    always @(*) begin
        case (current_state)
            A: next_state <= (s)?B:A;
            B: next_state <= B;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            current_state <= A;
            count_1s <= 0;
            timer <= 0;
        end
        else begin
            current_state <= next_state;
            if (current_state == B) begin
                if (timer == 2'd3) begin
                    timer = 0;
                    count_1s = 0;
                end
                if (w==1'b1) count_1s = count_1s + 1'b1;
                timer = timer + 1'b1;
            end
        end
    end
    
    assign z = (count_1s == 2'd2) & (timer == 2'd3);
        
endmodule