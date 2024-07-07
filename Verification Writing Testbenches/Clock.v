module top_module ( );
	reg clk1;
    always begin
        clk1 = 0;
        #5 clk1 = 1;
        #5;
    end
    dut first(clk1);
endmodule
