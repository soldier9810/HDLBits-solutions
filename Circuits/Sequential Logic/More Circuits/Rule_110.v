module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q );
    
    integer i;
    
    always @(posedge clk) begin
        if (load) q <= data;
        else begin
            for (i = 1 ; i < 511 ; i = i + 1) begin
                case({q[1],q[0]})
                    2'b11: q[0] <= 1'b1;
                    2'b10: q[0] <= 1'b0;
                    2'b01: q[0] <= 1'b1;
                    2'b00: q[0] <= 1'b0;
                endcase
                case({q[511],q[510]})
                    2'b11: q[511] <= 1'b1;
                    2'b10: q[511] <= 1'b1;
                    2'b01: q[511] <= 1'b1;
                    2'b00: q[511] <= 1'b0;
                endcase
                case({q[i+1],q[i],q[i-1]})
                    3'b111: q[i] <= 1'b0;
                    3'b110: q[i] <= 1'b1;
                    3'b101: q[i] <= 1'b1;
                    3'b100: q[i] <= 1'b0;
                    3'b011: q[i] <= 1'b1;
                    3'b010: q[i] <= 1'b1;
                    3'b001: q[i] <= 1'b1;
                    3'b000: q[i] <= 1'b0;
                endcase
            end
        end
    end

endmodule
