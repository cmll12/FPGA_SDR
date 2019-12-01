`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 12/01/19
// Design Name: 
// Module Name: peak_detect_tb
// Project Name: 


module AM_condition_tb;

    logic clk;
    logic rst;
    
    logic clk10;
    
    always begin
        #5;  //every 5 ns switch...so period of clock is 10 ns...100 MHz clock
        clk = !clk;
     end
     
     always begin
        #50;  //trigger 1 100MHz clk period pulse at 10 MHz
        clk10 = 1;
        #10;
        clk10 = 0;
        #40;
     end
     
     logic [11:0] LO_out;
     logic [23:0] IF_out;
     logic [17:0] center_freq;
     Local_Oscillator LO (.clk_in(clk),.rst(rst),.center_freq_div_20(center_freq),.LO_out(LO_out));
     
    
     assign IF_out[23:0] = (LO_out[11:0] * 12'hfff);
     
     logic signed [33:0] filter_out;
     assign filter_out = {{11{~IF_out[23]}}, IF_out[22:0]}; //converter to signed dec
     
     logic [3:0] scale;
     logic signed [33:0] peak_in;
     assign peak_in = filter_out >>> scale;
     
     logic [33:0] peak_value;
     
     Peak_detect_hold pd (.clk(clk),.rst(rst),.sample_ready(clk10),.sample_in(peak_in),.peak_value(peak_value));
     
     //3 switches determine audio level
     logic [2:0] sw_audio;
     logic signed [7:0] DAC_audio;
     logic audio_ready;
     
     AM_audio_condition uut (.clk(clk),.rst(rst),.audio_offset(peak_value),.audio_level(sw_audio),
                            .audio_out(DAC_audio),.audio_ready(audio_ready));
     
     initial begin
        rst = 1;
        clk = 1;
        scale = 0; //max peak_value = 2^34-1
        center_freq = 'd45_500;
        #30;
        rst = 0;
        
        //set audio level to min (0)
        sw_audio = 3'd5;
        #100_000;
        
        //set audio level to 1. Expect to see top cutoff
        sw_audio = 3'd5;
        #100_000; //wait 10us
        
        //scale = 1;
        
     end
     
endmodule
