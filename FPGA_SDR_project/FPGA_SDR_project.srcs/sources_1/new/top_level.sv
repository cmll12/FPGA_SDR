//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 11/10/2019 06:06:51 PM
// Design Name: 
// Module Name: ADC_Interface

module top_level(
        input clk_100mhz, //10 ns period
        input [15:14] sw, //reset switch
        input [5:0] jb, //ADC data in
        input [7:1] ja, //ADC data in
        output logic ja_0 //ADC clk pin
    );
  
    //system reset as sw[15]  
    logic rst; 
    assign rst = sw[15];
    
    //ADC variables
    logic [11:0] sample;
    logic ADC_data_valid;
    logic B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12;
    logic ADC_clk_gen;
    logic OTR;
     
    //map ADC pins to FPGA pins
    assign B1  = ja[3];
    assign B2  = ja[5];
    assign B3  = ja[7];
    assign B4  = jb[1];
    assign B5  = jb[3];
    assign B6  = jb[5];
    assign B7  = jb[4];
    assign B8  = jb[2];
    assign B9  = jb[0];
    assign B10 = ja[6];
    assign B11 = ja[4];
    assign B12 = ja[2];
    assign OTR = ja[1];
   
    assign ja_0 = ADC_clk_gen; //10MHz clock output from ADC interface
    
    //interface with AD9220
    ADC_Interface AD9220 (.clk_100mhz(clk_100mhz),.rst(rst),.sample_offset(sample),
                         .ADC_data_valid(ADC_data_valid),.ADC_clk(ADC_clk_gen),.B1(B1),.B2(B2),
                         .B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),.B8(B8),.B9(B9),.B10(B10),
                         .B11(B11),.B12(B12),.out_of_range(OTR));
                         
    //Local Oscillator
    //should be generated by center_freq_adjust module -----------------
    logic [17:0] center_freq_div_20 = 18'd50_000; //f_c = 1 MHz
    //------------------------------------------------------------------
    
    logic [11:0] LO_out;
    Local_Oscillator LO (.rst(rst), .clk_in(clk_100mhz),.center_freq_div_20(center_freq_div_20),
                            .LO_out(LO_out));
    
    logic [23:0] IF_out;
    Mixer sample_LO_mixer (.in_a(sample),.in_b(LO_out),.p_out(IF_out));
                            
    //for debug ----------
    
    //logic [12:0] ADC_data; //raw data from ADC for ila, OTR, MSB..LSB
    //assign ADC_data = {OTR, B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12}; 
    
    //adc_ila ila1 (.clk(clk_100mhz),.probe0(ADC_data),.probe1(ADC_clk_gen),.probe2(ADC_data_valid),.probe3(sample));
    
    logic [31:0] center_freq;
    assign center_freq = center_freq_div_20 * 20;
    ila_2 mixer_ila (.clk(clk_100mhz),.probe0(sample),.probe1(center_freq),.probe2(LO_out),.probe3(IF_out));
    
    ///-------------------
   
    
endmodule