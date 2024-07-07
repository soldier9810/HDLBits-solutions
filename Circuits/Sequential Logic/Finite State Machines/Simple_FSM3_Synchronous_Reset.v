module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    
    reg [1:0] state,next_state;
	parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
    
    always @(*) begin
        case (state) 
            A: next_state = (in==0)?A:B;
            B: next_state = (in==0)?C:B;
            C: next_state = (in==0)?A:D;
            D: next_state = (in==0)?C:B;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) state = A;
        else begin 
            state <= next_state;
        end
        
    end
    
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state==D)?1'b1:1'b0;

endmodule
