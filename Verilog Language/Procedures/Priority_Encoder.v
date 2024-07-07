// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    integer i,start;
	always begin
        start = 0;
        for ( i = 3 ; i >=0 ; i = i - 1) begin
            if (in[i]) start = i;
        end
        pos = start;
    end
endmodule
