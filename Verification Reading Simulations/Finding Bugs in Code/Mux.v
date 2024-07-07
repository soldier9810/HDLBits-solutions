module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0]out);

    always@(sel)
    begin
        if (sel)
        begin
            out = a;
    	end
        else
        begin
            out = b;
    	end
    end

endmodule
