//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay 
// 
// Create Date: 11/21/2019 04:57:11 PM
// Design Name: 
// Module Name: Mixer
//////////////////////////////////////////////////////////////////////////////////

module Mixer(
        input [11:0] in_a,
        input [11:0] in_b,
        
        output [23:0] p_out
    );
    
    assign p_out[23:0] = in_a[11:0] * in_b[11:0];
    
endmodule
