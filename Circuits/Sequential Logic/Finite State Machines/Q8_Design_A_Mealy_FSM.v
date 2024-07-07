module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
	
    localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3;
    reg [1:0] current_state, next_state;
    
    always @(*) begin
        case (current_state)
            s0: next_state <= (x)?s1:s0;
            s1: next_state <= (x)?s1:s2;
            s2: next_state <= (x)?s3:s0;
            s3: next_state <= (x)?s1:s2;
        endcase
    end
  
    always @(posedge clk or negedge aresetn) begin
        if (~aresetn) current_state <= s0;
        else current_state <= next_state;
    end
    
    assign z = (current_state == s2 & x==1'b1)?1'b1:1'b0;
    
endmodule
