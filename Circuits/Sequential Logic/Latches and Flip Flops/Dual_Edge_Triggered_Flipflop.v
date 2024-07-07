module top_module (
    input clk,
    input d,
    output q
); 
    
    reg ptemp, ntemp;
    
    always @(posedge clk) ptemp <= d;
    always @(negedge clk) ntemp <= d;
    
    assign q = (clk)?ptemp:ntemp;

endmodule
