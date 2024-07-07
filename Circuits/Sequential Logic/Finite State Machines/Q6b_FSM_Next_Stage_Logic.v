module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    localparam A = 3'b000, B= 3'b001, C= 3'b010, D= 3'b011, E= 3'b100, F= 3'b101;
    reg [2:0] temp;
    
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
    
    assign Y2 = temp[1];

endmodule
