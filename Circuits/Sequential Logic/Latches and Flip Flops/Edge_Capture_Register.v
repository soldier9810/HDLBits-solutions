module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    localparam A = 2'b0, B = 2'b01, C = 2'b10;
    
    reg [1:0] current_state [31:0];
    reg [1:0] next_state [31:0];
    integer i,j;
    
    always @(*) begin 
        for (i = 0; i < 32; i = i + 1) begin
            case (current_state[i])
                A: next_state[i] <= (in[i])?B:A;
                B: next_state[i] <= (in[i])?B:C;
                C: next_state[i] <= C;
            endcase
            out[i] <= (current_state[i] == C)?1'b1:1'b0;
        end
    end
    
    always @(posedge clk) begin
        if (reset) begin
            for (j = 0 ; j < 32 ; j = j + 1) begin
                current_state[j] <= (in[j])?B:A;
            end
        end
        else begin
            for (j = 0 ; j < 32 ; j = j + 1) begin
                current_state[j] <= next_state[j];
            end
        end
    end
    
   
    

endmodule
