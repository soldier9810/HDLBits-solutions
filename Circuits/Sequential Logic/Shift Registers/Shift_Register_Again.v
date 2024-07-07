module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    wire d3,d2,d1,d0;
    
    MUXDFF inst3(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], d3);
    MUXDFF inst2(KEY[0], d3, SW[2], KEY[1], KEY[2], d2);
    MUXDFF inst1(KEY[0], d2, SW[1], KEY[1], KEY[2], d1);
    MUXDFF inst0(KEY[0], d1, SW[0], KEY[1], KEY[2], d0);
    
    assign LEDR = {d3,d2,d1,d0};

endmodule

module MUXDFF (
	input clk,
    input w, R, E, L,
    output reg Q
);
    wire [1:0] t = {E,L};
    
    always @(posedge clk) begin
        case(t)
            2'b00: Q <= Q;
            2'b01: Q <= R;
            2'b10: Q <= w;
            2'b11: Q <= R;
        endcase
    end

endmodule
