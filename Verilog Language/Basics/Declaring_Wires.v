`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	wire abw,cdw,outw;
    assign abw = a&b;
    assign cdw = c&d;
    assign outw = abw|cdw;
    assign out = outw;
    assign out_n = ~outw;
endmodule
