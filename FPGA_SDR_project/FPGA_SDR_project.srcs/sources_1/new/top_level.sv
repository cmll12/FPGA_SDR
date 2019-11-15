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
    logic [11:0] sample_offset;
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
    
    logic [12:0] ADC_data; //raw data from ADC for ila, OTR, MSB..LSB
    assign ADC_data = {OTR, B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12}; 
    
    adc_ila ila1 (.probe0(ADC_data),.probe1(ADC_clk_gen),.probe2(ADC_data_valid),.probe3(sample_offset));
                    
    //interface with AD9220
    ADC_Interface AD9220 (.clk_100mhz(clk_100mhz),.rst(rst),.sample_offset(sample_offset),
                         .ADC_data_valid(ADC_data_valid),.ADC_clk(ADC_clk_gen),.B1(B1),.B2(B2),
                         .B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),.B8(B8),.B9(B9),.B10(B10),
                         .B11(B11),.B12(B12),.out_of_range(OTR));
   
    
endmodule