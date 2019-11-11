//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 11/10/2019 06:06:51 PM
// Design Name: 
// Module Name: ADC_Interface

module top_level(
        input clk_100mhz, //10 ns period
        input sw[15] //reset switch
    );
  
    //system reset as sw[15]  
    logic rst; 
    assign rst = sw[15];
    
    //ADC variables
    logic [11:0] sample_offset;
    logic ADC_data_valid;
    logic B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12;
    logic ADC_clk;
    logic OTR;
     
    //map ADC pins to FPGA pins
    assign B1  = 
    assign B2  = 
    assign B3  = 
    assign B4  = 
    assign B5  =
    assign B6  =
    assign B7  =
    assign B8  =
    assign B9  =
    assign B10 =
    assign B11 =
    assign B12 =
    assign OTR = 
    
    adc_ila ila1 (.probe0(B1),.probe1(B2),.probe2(B3),.probe3(B4),.probe4(B5),.probe5(B6),.probe6(B7),
                    .probe7(B8),.probe8(B9),.probe9(B10),.probe10(B11),.probe11(B12),
                    .probe12(OTR),.probe13(ADC_clk),.probe14(ADC_data_valid),.probe15(sample_offset));
                    
    //interface with AD9220
    ADC_Interface AD9220 (.clk_100mhz(clk_100mhz),.rst(rst),.sample_offset(sample_offset),
                         .ADC_data_valid(ADC_data_valid),.ADC_clk(ADC_clk),.B1(B1),.B2(B2),
                         .B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),.B8(B8),.B9(B9),.B10(B10),
                         .B11(B11),.B12(B12),.out_of_range(OTR));
   
    
endmodule