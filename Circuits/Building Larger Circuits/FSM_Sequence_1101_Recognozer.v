module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    reg [2:0] current_state, next_state;
    localparam A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
    
    always @(posedge clk) begin
        if (reset) current_state <= A;
        else current_state <= next_state;
    end
    
    always @(*) begin
        case (current_state)
            A: next_state = (data)?B:A;
            B: next_state = (data)?C:A;
            C: next_state = (data)?C:D;
            D: next_state = (data)?E:A;
            E: next_state = E;
        endcase
    end
    
    assign start_shifting = (current_state == E)?1'b1:1'b0;

endmodule
