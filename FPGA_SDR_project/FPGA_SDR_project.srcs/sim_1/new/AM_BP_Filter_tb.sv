`timescale 1ns / 1ps

module AM_BP_Filter_tb;

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
     
     parameter scale = 12'hfff;
     assign IF_out[23:0] = LO_out[11:0] * scale;
     
     //convert IF_out to signed value
     logic signed [23:0] sample;
     assign sample [23:0] = {~IF_out[23],IF_out[22:0]};
    
     //section 1 ------------------------------------------
     parameter N = 3;
     logic signed [17:0] b1 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
     logic signed [17:0] a1 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
     
     assign b1 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
     assign a1 [(N-2):0] = '{18'sd65380,-18'sd125527}; //a coeff MATLAB: 
     
     logic signed [33:0] filt_sec1_out;
     logic sec1_ready;
     
     AM_BP_Filter #(.N(N)) uut1 (.clk_in(clk),.rst(rst),.b(b1),.a(a1),
                    .sample_ready(clk10),.sample(sample),.filt_out(filt_sec1_out),.filt_valid(sec1_ready));

     //section 2 ------------------------------------------
     //same N as section 1
     
     logic signed [23:0] filt_2_in;
     //divide output from filter section 1 by 2^11 to fit 24 bit input parameter
     assign filt_2_in = (filt_sec1_out>>>11);
     
     logic signed [17:0] b2 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
     logic signed [17:0] a2 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
     
     assign b2 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
     assign a2 [(N-2):0] = '{18'sd65383,-18'sd125680}; //a coeff MATLAB: 
     
     logic signed [33:0] filt_sec2_out;
     logic sec2_ready;
     
     AM_BP_Filter #(.N(N)) uut2 (.clk_in(clk),.rst(rst),.b(b2),.a(a2),
                    .sample_ready(sec1_ready),.sample(filt_2_in),.filt_out(filt_sec2_out),.filt_valid(sec2_ready));
     
     //section 3 ------------------------------------------
     //same N as section 1
     
     logic signed [23:0] filt_3_in;
     //divide output from filter section 1 by 2^11 to fit 24 bit input parameter
     assign filt_3_in = (filt_sec2_out>>>11);
     
     logic signed [17:0] b3 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
     logic signed [17:0] a3 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
     
     assign b3 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
     assign a3 [(N-2):0] = '{18'sd65227,-18'sd125456}; //a coeff MATLAB: 
     
     logic signed [33:0] filt_sec3_out;
     logic sec3_ready;
     
     AM_BP_Filter #(.N(N)) uut3 (.clk_in(clk),.rst(rst),.b(b3),.a(a3),
                    .sample_ready(sec2_ready),.sample(filt_3_in),.filt_out(filt_sec3_out),.filt_valid(sec3_ready));
     //-----------------------------------------------
     
     initial begin
        //reset system
        rst = 1;
        clk = 1;
        center_freq = 'd45_500;
        #30;
        rst = 0;
        //run system
        #300_000;   
        //460khz 
        center_freq = 'd45_750; 
        #300_000;   
        //450khz
        center_freq = 'd45_250;  
        #1000;
     end
     
      
endmodule
