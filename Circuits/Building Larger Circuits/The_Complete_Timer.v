module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg [3:0] count,
    output counting,
    output done,
    input ack );
    
    localparam s = 4'd0, s1 = 4'd1, s11 = 4'd2, s110 = 4'd3, b0 = 4'd4, b1 = 4'd5, b2 = 4'd6, b3 = 4'd7, Count = 4'd8, Wait = 4'd9;
    reg [9:0] temp_count;
    reg [3:0] current_state, next_state;    
    
    always @(*) begin
        case (current_state)
            s: next_state <= (data)? s1 : s;
            s1: next_state <= (data)? s11 : s;
            s11: next_state <= (data)? s11 : s110;
            s110: next_state <= (data)? b0 : s;
            b0: next_state <= b1;
            b1: next_state <= b2;
            b2: next_state <= b3;
            b3: next_state <= Count;
            Count: next_state <= (temp_count == 0 & count == 0)?Wait:Count;
            Wait: next_state <= (ack)? s : Wait;            
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
            current_state <= s;
        end
        else current_state <= next_state;
    end
    
    always @(posedge clk) begin
        case (current_state)
            b0: count <= {count[2:0],data};
            b1: count <= {count[2:0],data};
            b2: count <= {count[2:0],data};
            b3: begin
                count <= {count[2:0],data};
                temp_count <= 10'd999;
            end
            Count: begin
                if (temp_count > 0 | count > 0) begin
                    if (temp_count == 10'd0 & count > 0) begin
                        temp_count <= 10'd999;
                        count <= count - 1'b1;
                    end
                    else begin
                        temp_count <= temp_count - 1'b1;
                        count <= count;
                    end
                end
            end
        endcase
    end
    
    assign done = (current_state==Wait)?1'b1:1'b0;
    assign counting = (current_state == Count)?1'b1:1'b0;

endmodule
