`timescale 1ns / 1ps

module lo_tb;

    logic clk;
    logic rst;
    logic [17:0] center_freq_div_20;
    logic [11:0] LO_out;
    
     always begin
        #5;  //every 5 ns switch...so period of clock is 10 ns...100 MHz clock
        clk = !clk;
     end
    
     Local_Oscillator uut (.rst(rst), .clk_in(clk),.center_freq_div_20(center_freq_div_20),
                            .LO_out(LO_out));
     
     initial begin
        //reset system
        rst = 1;
        clk = 1;
        center_freq_div_20 = 18'd25_000; //set center_freq = 500khz, thefore
                                   //f_lo = 45khz
        #20;
        rst = 0;
        #27000;
        center_freq_div_20 = 18'd50_000; //set center_freq = 1mhz, thefore
                                   //f_lo = 545khz
        #10000;
        

     end    
       
endmodule
