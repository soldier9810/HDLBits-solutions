module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	
    // assign out = (c&~b) | (a&c) | (d&(~c&~d&b)) | (~d&(a&b&~c&~d)) | (d&(~c&a)) | (~d&(a&~d)); //Initially 
    // assign out = (c&~b) | (a&c) | (a&b&~c&~d) | (d&(~c&a)) | (a&~d); // Simplified further
    assign out = a | (c&~b); // Even more simplified
    
endmodule