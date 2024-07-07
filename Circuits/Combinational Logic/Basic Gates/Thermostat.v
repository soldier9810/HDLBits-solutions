module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always @(*) begin
        case(mode)
            1'b0: {heater,aircon,fan} = (too_hot==1'b1)?3'b011:{2'b00,fan_on};
            1'b1: {heater,aircon,fan} = (too_cold==1'b1)?3'b101:{2'b00,fan_on};
            default: {heater,aircon,fan} = {2'b00,fan_on};
        endcase
    end

endmodule
