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
    logic [23:0] ds_audio_offset;
    
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
                //take top 24 bits of audio_offset (>>11)
                ds_audio_offset <= audio_offset[33:10];
                sample_ready <= 1;
            end else begin
                sample_ready <= 0 ;
                count <= count + 1;
            end //else trigger
        end //else rst
    end
    
    //High pass to remove DC offset ----------
    //initialize coeffs
    parameter N = 3;
    logic signed [17:0] b1 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a1 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b1 [(N-1):0] = '{18'sd65536,-18'sd131072,18'sd65536}; //b coeff MATLAB: [1,-2,1]
    assign a1 [(N-2):0] = '{18'sd65321,-18'sd130856}; //a coeff MATLAB: 
    
    //convert to signed value for HP filter input
    logic signed [23:0] HP_in;
    assign HP_in = {~ds_audio_offset[23],ds_audio_offset[22:0]};
    
    logic signed [33:0] HP_out;
    
    //triggers on ADC_sample_valid
    AM_BP_Filter #(.N(N)) audio_HP_sec_1 (.clk_in(clk),.rst(rst),.b(b1),.a(a1),
                .sample_ready(sample_ready),.sample(HP_in),.filt_out(HP_out),.filt_valid(audio_ready));
    
    //Shift level of audio and shrink to 8 bit value
    logic signed [33:0] HP_shifted;
    //shifts between 26 and 12 bits (since max audio level = 7)
    //therefore min HP_shifted must be 20 bits to hear max volume on output
    assign HP_shifted = HP_out >>> ('d26 - 2*audio_level);
    assign audio_out = HP_shifted;
    
endmodule