module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    localparam A = 0, B = 1;
    
    reg [1:0] current_state;
    wire [1:0] next_state;
    
    assign next_state[A] = current_state[A]&(~x);
    assign next_state[B] = (current_state[A] | current_state[B])&x | current_state[B]&(~x);
    assign z = (current_state[A]&x | current_state[B]&~x) ? 1'b1 : 1'b0;
    
    always @(posedge clk or posedge areset) begin
        if (areset) current_state <= 2'b01;
        else begin
            current_state <= next_state;
        end
    end
    
endmodule
