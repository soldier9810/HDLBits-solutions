module top_module();
    reg [1:0]in;
    reg out;
	initial begin
        in[1] = 0;
        in[0] = 0;
        #10 in[0] = 1;
        #10 in[0] = 0;
        in[1] = 1;
        #10 in[0] = 1;
    end
    andgate one(in,out);
endmodule
