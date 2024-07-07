module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
	
    localparam A = 3'b000, B= 3'b001, C= 3'b010, D= 3'b011, E= 3'b100, F= 3'b101;
    reg [2:0] temp, y;
    
    always @(*) begin
        case(y)
            A: temp <= (w)?A:B;
            B: temp <= (w)?D:C;
            C: temp <= (w)?D:E;
            D: temp <= (w)?A:F;
            E: temp <= (w)?D:E;
            F: temp <= (w)?D:C;
            default: temp <= A;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) y <= A;
        else y <= temp;
    end
    
    assign z = (y==E | y==F);
    
endmodule
