module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
    
    localparam same = 1'b0, comp = 1'b1;
    wire temp;
    reg current_state, next_state;

    always @(*) begin
        case (current_state)
            same: next_state <= (x==1'b1)?comp:same;
            comp: next_state <= comp;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            current_state <= same; 
            z <= 1'b0;
        end
        else begin
            current_state <= next_state;
            z <= temp;
        end
    end
    
    assign temp = (areset) ? 1'b0: ((current_state==same)?x:~x);


endmodule
