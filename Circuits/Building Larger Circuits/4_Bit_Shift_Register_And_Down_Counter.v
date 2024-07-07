module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output reg [3:0] q);
    
    initial begin
        q <= 1'b0;
    end
    
    always @(posedge clk) begin
            case ({shift_ena, count_ena})
                2'b00: q <= q;
                2'b01: q <= q - 1'b1;
                2'b10: q <= {q[2:0], data};
                2'b11 : q <= q - 1'b1;
            endcase
    end

endmodule
