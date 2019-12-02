`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2019 06:51:16 PM
// Design Name: 
// Module Name: DAC_stuff
//////////////////////////////////////////////////////////////////////////////////


module DAC_stuff(input clk_in, input rst_in, input [7:0] level_in, output logic pwm_out);
    
//PWM generator for audio generation
 
    logic [7:0] count;
    assign pwm_out = count<level_in;
    always_ff @(posedge clk_in)begin
        if (rst_in)begin
            count <= 8'b0;
        end else begin
            count <= count+8'b1;
        end
    end
    
endmodule
