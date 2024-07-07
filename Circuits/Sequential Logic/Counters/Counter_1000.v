module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);
    wire [3:0] counter0_out, counter1_out, counter2_out;
    
    bcdcount counter0 (clk, reset, c_enable[0], counter0_out);
    bcdcount counter1 (clk, reset, c_enable[1], counter1_out);
    bcdcount counter2 (clk, reset, c_enable[2], counter2_out);
    
    assign c_enable = {(counter0_out==4'b1001)&(counter1_out==4'b1001), (counter0_out==4'b1001), 1'b1};
    assign OneHertz = (counter0_out==4'b1001)&(counter1_out==4'b1001)&(counter2_out==4'b1001);

endmodule
