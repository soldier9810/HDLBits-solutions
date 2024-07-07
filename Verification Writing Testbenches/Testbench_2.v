module top_module();

    reg clk, in;
    reg [2:0] s;
    wire out;
    
    initial begin
        clk = 0;
        in = 0;
        s = 3'd2;
        #10 s = 3'd6;
        #10 s = 3'd2;
        	in = 1'b1;
        #10 s = 3'd7;
        	in = 1'b0;
        #10 s = 3'd0;
        	in = 1'b1;
        #30 s = 3'd0;
        	in = 1'b0;
    end
    
    always begin
        #5 clk <= ~clk;
    end
    
    
    q7 inst1(clk, in, s, out);
    
endmodule
