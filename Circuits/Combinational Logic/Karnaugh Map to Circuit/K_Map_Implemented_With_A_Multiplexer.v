module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    wire [1:0] t = {c,d};  
    always @(*) begin
        case(t)
            2'b00: mux_in <= 4'b0100;
            2'b01: mux_in <= 4'b0001;
            2'b10: mux_in <= 4'b0101;
            2'b11: mux_in <= 4'b1001;
        endcase
    end

endmodule
