module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z );
    
    reg [7:0] shift_reg;
    
    always @(posedge clk) begin
        shift_reg <= (enable)?{shift_reg[6:0],S}: shift_reg;
    end
    
    assign Z = shift_reg[{A,B,C}];

endmodule
