//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 11/27/2019 09:42:18 PM9
// Design Name: 
// Module Name: AM_audio_condition
//////////////////////////////////////////////////////////////////////////////////

module AM_audio_condition(
        input clk, //should be 100 MHz for proper sampling
        input rst,
        //signal from peak detect, 10 MSPS
        input [33:0] audio_offset,
        //audio level, set by 3 switches
        input [2:0] audio_level,
        
        //8 bit audio signal, centered at 0
        output signed [7:0] audio_out,
        //triggers when new 8 bit audio signal ready
        output logic audio_ready
    );
    
    //downsample to 48 khz  -------
    parameter COUNT_48k = 2082;
    
    logic [11:0] count;
    logic trigger;
    //down-sampled, amplitude adjusted audio (48kHz). Still contains DC offset and is 24 bits
    logic [33:0] ds_audio_offset;
    
    //trigger once every COUNT_48k cycles
    assign trigger = (count == COUNT_48k);
    
    //HP filter trigger
    logic sample_ready; 
    
    always_ff @(posedge clk) begin
        if (rst) count <= 0;
        else begin
            //rst count every COUNT_48k periods of 100MHz clock for 48kHz sample rate
            if (trigger) begin
                count <= 0;
                ds_audio_offset <= audio_offset;
                sample_ready <= 1;
            end else begin
                sample_ready <= 0 ;
                count <= count + 1;
            end //else trigger
        end //else rst
    end
   
    //Moving average to compute audio offset
    //array of past peak detect outputs
    logic [33:0] window [31:0];
    //current index in window
    logic [4:0] index; 
    logic [5:0] sum_i; //index for computing sum
    logic [38:0] sum; //sum of values in window
    logic [33:0] avg; //average value of window
    
    always_ff @(posedge clk) begin
        if (rst) begin
            //initialize all values in window to 0
            for (int i=0; i<32; i=i+1) begin
                window[i] <= 0; 
            end
            //reset index
            index <= 0;
            sum_i <= 0;
            sum <= 0;
            audio_ready <= 0;
        end else begin //rst else
            if (sample_ready) begin
                //store current down sampled offset audio 
                window[index] <= ds_audio_offset;
                index <= index + 1;
                sum <= 0;
                sum_i <= 0;
            end else begin
                //no sample, still computing avg
                if (sum_i < 32) begin
                    sum <= sum + window[sum_i];
                    sum_i = sum_i + 1;
                end else begin //done computing avg
                    sum_i <= 33; //stop computing avg if done by holding sum_i at 32
                    avg <= (sum >> 5); //divide sum by 32 (# of window values) to get average
                end //sum_i
                
                //asserts audio_ready once done summing, for 1 clk cycle
                if (sum_i == 32) audio_ready <= 1;
                else audio_ready <=0;
                
            end //sample_ready else
        end //rst
    end //always_ff
    
    //Shift level of audio and shrink to 8 bit value
    //ds_audio must be 34 bits since signed and could hold value that's 33 bits unsigned (as
    //avg approaches equilibrium)
    logic signed [34:0] ds_audio;
    assign ds_audio = ds_audio_offset - avg;
    
    //shifts between 20 and 6 bits (since max audio level = 7)
    assign audio_out = ( ds_audio >>> ('d20 - 2*audio_level) );
    
endmodule