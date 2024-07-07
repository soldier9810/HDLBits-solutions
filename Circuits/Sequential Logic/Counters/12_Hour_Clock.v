module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 
    
    always @(posedge clk) begin
        if (reset) {hh,mm,ss,pm} = {8'b00010010, 8'b0, 8'b0, 1'b0};
        else begin
            if (ena) begin
                pm <= (hh==8'b00010001 & mm == 8'b01011001 & ss == 8'b01011001)? ~pm : pm;
                if (ss[7:4] < 4'd6 & ss[3:0] < 4'd10) begin
                    ss[3:0] <= (ss[3:0]==4'd9)? 4'd0 : ss[3:0] + 1'b1;
                    ss[7:4] <= (ss[3:0]==4'd9)? ((ss[7:4]==4'd5)?4'd0: ss[7:4] + 1'b1): ss[7:4];
                end
                
                if (ss[7:4] == 4'd5 & ss[3:0] == 4'd9) begin
                    if (mm[7:4] < 4'd6 & mm[3:0] < 4'd10) begin
                        mm[3:0] <= (mm[3:0]==4'd9)? 4'd0 : mm[3:0] + 1'b1;
                        mm[7:4] <= (mm[3:0]==4'd9)? ((mm[7:4]==4'd5)?4'd0: mm[7:4] + 1'b1): mm[7:4];
                end
                end
                else mm <= mm;
                
                if (mm[7:4] == 4'd5 & mm[3:0] == 4'd9 & ss[7:4] == 4'd5 & ss[3:0] == 4'd9) begin
                    if (hh[7:4] == 4'd0) begin
                        hh[3:0] <= (hh[3:0] < 4'd9)?hh[3:0] + 1'b1: 4'd0;
                        hh[7:4] <= (hh[3:0] == 4'd9)?4'd1:hh[7:4];
                    end
                    else begin
                        hh[3:0] <= (hh[3:0] < 4'd2)?hh[3:0] + 1'b1: 4'd1;
                        hh[7:4] <= (hh[3:0] == 4'd2)?4'd0:hh[7:4];
                    end
                end
                
            end
            else {hh,mm,ss,pm} <= {hh,mm,ss,pm};
        end
    end

endmodule