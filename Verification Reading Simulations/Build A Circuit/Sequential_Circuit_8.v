module top_module (
    input clock,
    input a,
    output p,
    output reg q);
    
    always @(*) p <= (clock)?a:p;
    
    always @(negedge clock) q <= p;
    
endmodule
