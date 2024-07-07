module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    wire r0 = SW[0]; 
    wire r1 = SW[1]; 
    wire r2 = SW[2];
    wire L = KEY[1]; 
    wire clk = KEY[0];
	reg q0, q1, q2;
    
    always @(posedge clk) begin
        q0 <= (L)?r0:q2;
        q1 <= (L)?r1:q0;
        q2 <= (L)?r2:q2^q1;
    end
    
    assign LEDR[0] = q0;
    assign LEDR[1] = q1; 
    assign LEDR[2] = q2;

endmodule