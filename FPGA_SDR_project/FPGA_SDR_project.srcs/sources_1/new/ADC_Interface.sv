//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 11/10/2019 06:06:51 PM
// Design Name: 
// Module Name: ADC_Interface

module ADC_Interface(
        input clk_100mhz, //10 ns period
        input rst, //system reset
        output logic [11:0] sample_offset, //most recent sample, 0-4095
        output logic ADC_data_valid, //triggered high at 10 MHz, otherwise off
        //ADC I/O
        output logic ADC_clk, //ADC clk pin
        input B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,//bits 1-12 from ADC
        input out_of_range
    );
           
   //format ADC values in array, including out of range bit
    logic [12:0] raw_values;
    assign raw_values[12:0] = {out_of_range, B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11};
    
    //10 mhz clk (100 ns) with 50% duty cycle with rising edge synced with 100mHz clk
    //rising edge. ADC sample rate = 10 MSPS 
    logic clk_10mhz;
    logic [3:0] clk_count;

    assign ADC_clk = clk_10mhz;
    
    //trigger every time clk_10mhz goes high while creating 50% DC 10mhz clk
    logic trigger;
    always_comb begin
        if (!rst) begin
            if (clk_count <= 4) clk_10mhz = 1;
            else clk_10mhz = 0;
        end else
            clk_10mhz = 0;
    end
    always_ff @(posedge clk_100mhz) begin
        if (!rst) begin
            //reset clk every 10 counts of 100mHz clk, otherwise increment
            if (clk_count == 9) begin
                clk_count <= 0;
                trigger <= 1;
            end else begin
                clk_count <= clk_count + 1;
                trigger <= 0;
            end
        end else begin
            clk_count <= 9;
            trigger <=0;
        end //end else
    end //end always_ff  
    
    //sync ADC pins by passing input through 2 registers
    //registers for syncing ADC input data
    logic [12:0] prev_data;
    logic [12:0] sync_data;
   
    always_ff @(posedge clk_100mhz) begin
        if (rst) begin
            prev_data <= 12'b0;
            sync_data <= 12'b0;
        end else begin
            //sync all 12 input pins with 2 registers
            for (int i=0; i<=12; i=i+1) begin
                prev_data[i] <= raw_values[i];
                sync_data[i] <= prev_data[i];    
            end //for 
        end //rst else 
    end //always_ff
    
    //updates ouput value once ADC data has become valid
    //AND passes through 2 registers (2 clk periods for 
    //data valid, + 2 clk periods for sync registers.
    //Asserts ADC_data_valid once new data is valid
    logic [3:0] count;
    always_ff @(posedge clk_100mhz) begin
        if (rst) begin
            count <= 5;
            sample_offset[11:0] <= 12'h000;
            ADC_data_valid <= 0;
        end else begin
            if (trigger) begin
                count <= 1;     
            end else begin
                //once waited for 4 clk periods...
                if (count == 4) begin
                    //assert data valid
                    ADC_data_valid <= 1;
                    //ouput ADC synced data if not out of range, otherwise output max value
                    sample_offset[11:0] <= !sync_data[12] ? sync_data[11:0] : 12'hFFF;
                end else ADC_data_valid <= 0;
                //just keep counting....should be okay becuase trigger will always reset count before it overflows
                count <= count + 1;
            end //end trigger else
        end //rst else
    end  //end always_ff
    
endmodule
