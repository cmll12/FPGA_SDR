`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2019 08:59:16 PM
// Design Name: 
// Module Name: ADC_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ADC_tb;

     logic clk;
     logic rst;
     logic [11:0] sample_offset;
     logic ADC_data_valid;
     logic B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12;
     logic ADC_clk;
     logic OTR;
     
     ADC_Interface uut (.clk_100mhz(clk),.rst(rst),.sample_offset(sample_offset),
                        .ADC_data_valid(ADC_data_valid),.ADC_clk(ADC_clk),.B1(B1),.B2(B2),
                        .B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),.B8(B8),.B9(B9),.B10(B10),
                        .B11(B11),.B12(B12),.out_of_range(OTR));
     
     always begin
        #5;  //every 5 ns switch...so period of clock is 10 ns...100 MHz clock
        clk = !clk;
     end
        
    initial begin
        $display("Starting Sim"); 
        clk = 0; 
        
        B1 = 0;
        B2 = 1;
        B3 = 0;
        B4 = 0;
        B5 = 0;
        B6 = 1;
        B7 = 0;
        B8 = 0;
        B9 = 0;
        B10 = 0;
        B11 = 0;
        B12 = 1;
        
        OTR = 0;
        //reset system
        rst = 1;
        #24
        rst = 0;
        #1 
        //rising edge of ADC_clk, grabs sample
        #20 //wait 20ns from rising edge of ADC_clk (when ADC raw data is valid), then change sample input
        B1 = 0;
        B2 = 0;
        B3 = 0;
        B4 = 0;
        B5 = 0;
        B6 = 0;
        B7 = 0;
        B8 = 0;
        B9 = 1;
        B10 = 0;
        B11 = 0;
        B12 = 0;
        
        OTR = 0;
        
        //run for 50 cycles
        #500
        
        
        $finish;
    
    end
    
    
    
endmodule
