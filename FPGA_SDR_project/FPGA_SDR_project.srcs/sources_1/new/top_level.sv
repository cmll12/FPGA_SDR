//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay, Colin Chaney
// 
// Create Date: 11/10/2019 06:06:51 PM
// Design Name: 
// Module Name: ADC_Interface

module top_level(
        input clk_100mhz, //10 ns period
        input [15:0] sw, //reset switch
        input btnc, btnu, btnl, btnr, btnd,
        input [5:0] jb, //ADC data in
        input [7:1] ja, //ADC data in
        input [7:0] jc, //Encoders
        input [7:0] jd, //Encoders
        output logic ja_0, //ADC clk pin
        output logic led16_r,
        output logic led16_g,
        output logic led16_b,
        output logic [15:0] led,
        output logic aud_pwm,
        output logic aud_sd,
        output[3:0] vga_r,
        output[3:0] vga_b,
        output[3:0] vga_g,
        output vga_hs,
        output vga_vs
    );
  
    //system reset as sw[15]  
    logic rst; 
    assign rst = sw[15];
    
    
    //Creates both another 100mhz clock and a 65mhz clock.
    //A second 100mhz clock was needed because the original
    //clock is constrained to the clkdivider
    logic clk100mhz;
    logic clk_65mhz;
    clk_wiz_0 clkdivider(.clk_in1(clk_100mhz), 
                         .clk_out1(clk100mhz), 
                         .clk_out2(clk_65mhz));
    
    //A wire for each pin of an an encoder that we used. In
    //total we had 5 encoders with three wires being important
    //for operation, those being clk, dt, and sw.
    wire encoder1_clk;
    wire encoder1_dt;
    wire encoder1_sw;
    wire encoder2_clk;
    wire encoder2_dt;
    wire encoder2_sw;
    wire encoder3_clk;
    wire encoder3_dt;
    wire encoder3_sw;
    wire encoder4_sw;
    wire encoder5_clk;
    wire encoder5_sw;
    wire encoder5_dt;
    
    //Each of the signals are synchronized to the 65 mhz clock
    //based upon their PMOD input port. We chose 65 mhz because
    //most modules that need the inputs from these devices run on
    //65 mhz
    synchronize encoder1_clk_synchronize(
        .clk(clk_65mhz),
        .in(jc[0]),
        .out(encoder1_clk));
        
    synchronize encoder1_dt_synchronize(
        .clk(clk_65mhz),
        .in(jc[1]),
        .out(encoder1_dt));
        
    synchronize encoder1_sw_synchronize(
        .clk(clk_65mhz),
        .in(jc[5]),
        .out(encoder1_sw));
        
    synchronize encoder2_clk_synchronize(
        .clk(clk_65mhz),
        .in(jc[2]),
        .out(encoder2_clk));
        
    synchronize encoder2_dt_synchronize(
        .clk(clk_65mhz),
        .in(jc[3]),
        .out(encoder2_dt));
        
    synchronize encoder2_sw_synchronize(
        .clk(clk_65mhz),
        .in(jc[4]),
        .out(encoder2_sw));
        
    synchronize encoder3_clk_synchronize(
        .clk(clk_65mhz),
        .in(jc[6]),
        .out(encoder3_clk));
        
    synchronize encoder3_dt_synchronize(
        .clk(clk_65mhz),
        .in(jc[7]),
        .out(encoder3_dt));
        
    synchronize encoder3_sw_synchronize(
        .clk(clk_65mhz),
        .in(jd[2]),
        .out(encoder3_sw));
        
    synchronize encoder4_sw_synchronize(
        .clk(clk_65mhz),
        .in(jd[3]),
        .out(encoder4_sw));
        
    synchronize encoder5_clk_synchronize(
        .clk(clk_65mhz),
        .in(jd[4]),
        .out(encoder5_clk));
        
    synchronize encoder5_sw_synchronize(
        .clk(clk_65mhz),
        .in(jd[0]),
        .out(encoder5_sw));
    
    synchronize encoder5_dt_synchronize(
        .clk(clk_65mhz),
        .in(jd[5]),
        .out(encoder5_dt));
    
    //After synchronizing the signals we have to
    //debounce them. These wires corespond to the 
    //debounces signal afterward
    wire encoder1_clk_db;
    wire encoder1_dt_db;
    wire encoder1_sw_db;
    wire encoder2_clk_db;
    wire encoder2_dt_db;
    wire encoder2_sw_db;
    wire encoder3_clk_db;
    wire encoder3_dt_db;
    wire encoder3_sw_db;
    wire encoder4_sw_db;
    wire encoder5_clk_db;
    wire encoder5_sw_db;
    wire encoder5_dt_db;
    
    //All of the encoder signals are debounced
    debounce encoder1_clk_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder1_clk),
        .clean_out(encoder1_clk_db));
        
    debounce encoder1_dt_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder1_dt),
        .clean_out(encoder1_dt_db));
        
    debounce encoder1_sw_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder1_sw),
        .clean_out(encoder1_sw_db));
        
    debounce encoder2_clk_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder2_clk),
        .clean_out(encoder2_clk_db));
        
    debounce encoder2_dt_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder2_dt),
        .clean_out(encoder2_dt_db));
        
    debounce encoder2_sw_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder2_sw),
        .clean_out(encoder2_sw_db));
    
    debounce encoder3_clk_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder3_clk),
        .clean_out(encoder3_clk_db));
        
    debounce encoder3_dt_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder3_dt),
        .clean_out(encoder3_dt_db));
        
    debounce encoder3_sw_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder3_sw),
        .clean_out(encoder3_sw_db));
       
    debounce encoder4_sw_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder4_sw),
        .clean_out(encoder4_sw_db));
        
    debounce encoder5_clk_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder5_clk),
        .clean_out(encoder5_clk_db));
        
    debounce encoder5_sw_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder5_sw),
        .clean_out(encoder5_sw_db));
        
    debounce encoder5_dt_debounce(
        .reset_in(rst),
        .clock_in(clk_65mhz),
        .noisy_in(encoder5_dt),
        .clean_out(encoder5_dt_db));
        
    //This is a general code block used many times.
    //The purpose is to toggle a mode of operation
    //by clicking the switch on an encoder. This one
    //is meant to change whether fast mode is enabled
    reg is_fast = 0;
    //Used to compare against past value of operation. 
    logic past_fast_value;
    always_ff @(posedge clk_65mhz) begin
       //This makes sure we go from a high to a low value.
       //The encoders are active low.
       if(!encoder3_sw_db & past_fast_value ) begin
          //If this happens then we need to change mode.
          //By adding 1 the bit will either overflow or not,
          //toggling between the modes
          is_fast <= is_fast + 1;
       end
       //Write past value so we can see the transition from 
       //high to low.
       past_fast_value <= encoder3_sw_db;
    end
    
    //Used to select if we are on AM or FM demodulation.
    reg modulation_select_sw = 0;
    logic past_modulation_value;
    always_ff @(posedge clk_65mhz) begin
       if(!encoder5_sw_db & past_modulation_value ) begin
          modulation_select_sw <= modulation_select_sw + 1;
       end
       past_modulation_value <= encoder5_sw_db;
    end
    
    //Used to see if we want to change or trigger height
    //or if we want to change our signal height.
    reg trigger_wanted = 0;
    logic past_trigger_value;
    always_ff @(posedge clk_65mhz) begin
       if(!encoder2_sw_db & past_trigger_value ) begin
          trigger_wanted <= trigger_wanted + 1;
       end
       past_trigger_value <= encoder2_sw_db;
    end
    
    //Used to toggle the FFT or signal display
    reg is_fft = 0;
    logic past_fft_value;
    always_ff @(posedge clk_65mhz) begin
       if(!encoder4_sw_db & past_fft_value ) begin
          is_fft <= is_fft + 1;
       end
       past_fft_value <= encoder4_sw_db;
    end
    
    //Used only if we aren't display the FFT. This
    //toggles whether we want to see the raw ADC in
    //signal or if we want to see the demodulated
    //audio signal.
    reg is_audio = 0;
    logic past_audio_value;
    always_ff @(posedge clk_65mhz) begin
       //Relies on previous is_fft values so we don't switch
       //it if we are in the wrong display mode.
       if(!encoder1_sw_db & past_audio_value & !is_fft) begin
          is_audio <= is_audio + 1;
       end
       past_audio_value <= encoder1_sw_db;
    end
    
    //Used only if we are displaying the FFT. This toggles
    //whether we want to do the narow band waterfall or not.
    //Currently the waterfall doesn't work.
    reg is_waterfall = 0;
    logic past_waterfall_value;
    always_ff @(posedge clk_65mhz) begin
       //Relies on previous is_fft values so we don't switch
       //it if we are in the wrong display mode.
       if(!encoder1_sw_db & past_waterfall_value & is_fft) begin
          is_waterfall <= is_waterfall + 1;
       end
       past_waterfall_value <= encoder1_sw_db;
    end
    
    //LED lights to help show what modulation scheme we are on
    always_comb begin
       //If high, this means we are demodulating FM.
       if(modulation_select_sw) begin
          //If sw[14] is high, it means we are demodulating
          //a wide band FM. Else, it is narrow band FM.
          if(sw[14]) begin
             //Sets color blue
             led16_r <= 0;
             led16_g <= 0;
             led16_b <= 1;
          end else begin
             //Sets color green
             led16_r <= 0;
             led16_g <= 1;
             led16_b <= 0;
          end
       //We are demodulating AM
       end else begin
          //Sets color red
          led16_r <= 1;
          led16_g <= 0;
          led16_b <= 0;
       end
    end

    //Wires for VGA display
    wire [10:0] hcount;       // Pixel on current line
    wire [9:0] vcount;        // Line number
    wire hsync, vsync, blank; // Signals to output on connector
    reg [11:0] rgb;           // Pixel out color
    
    //Given module that outputs the correct timing for each signal
    xvga xvga1(.vclock_in(clk_65mhz),.hcount_out(hcount),.vcount_out(vcount),
          .hsync_out(hsync),.vsync_out(vsync),.blank_out(blank));
    
    //Setup speaker output
    assign aud_sd = 1;
    
    //ADC variables
    logic [11:0] sample;    //The actual output of the ADC
    logic ADC_data_valid;   //Goes high if data is valid
    logic B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12;   //Specific raw bits out
    logic ADC_clk_gen;      //The clock we send out to get the ADC working
    logic OTR;              //Overflow bit
     
    //Map ADC pins to FPGA PMOD pins
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
    
    //Variable used for the center frequency
    logic [17:0] center_freq_div_20;
    
    //Module that adjusts the center frequency based on the knob inputs
    control_center_frequency adjust_frequency(
        .clk(clk_65mhz), 
        .right(encoder3_clk_db), 
        .left(encoder3_dt_db), 
        .reset(rst), 
        .center_frequency_out(center_freq_div_20), 
        .is_fast(is_fast));
        
    
    logic [4:0] sw_audio;               //Determine audio level
    logic signed [7:0] DAC_audio_in;    //Audio sent to DAC
    
    //Sets the volume based on the knob inputs and the current DAC value
    control_volume(
              .clk(clk_65mhz), 
              .up(encoder5_clk_db), 
              .down(encoder5_dt_db), 
              .reset(rst), 
              .DAC_in(DAC_audio_in),
              .volume_out(sw_audio));
    //------------------------------------------------------------------
    
    
    //Interface with AD9220
    ADC_Interface AD9220 (.clk_100mhz(clk100mhz),.rst(rst),.sample_offset(sample),
                         .ADC_data_valid(ADC_data_valid),.ADC_clk(ADC_clk_gen),.B1(B1),.B2(B2),
                         .B3(B3),.B4(B4),.B5(B5),.B6(B6),.B7(B7),.B8(B8),.B9(B9),.B10(B10),
                         .B11(B11),.B12(B12),.out_of_range(OTR));
                         
    //Local Oscillator
    logic [11:0] LO_out;
    Local_Oscillator LO (.rst(rst), .clk_in(clk100mhz),.center_freq_div_20(center_freq_div_20),
                            .LO_out(LO_out));
    
    //Mixer
    logic [23:0] IF_out;
    Mixer sample_LO_mixer (.in_a(sample),.in_b(LO_out),.p_out(IF_out));
    
    //convert mixer IF out to signed integer
    logic signed [23:0] IF_signed;
    assign IF_signed = {~IF_out[23],IF_out[22:0]};
    
    //FM Demodulation Stage 1 (BP filter and derivative)
    logic signed [33:0] FM_stage_1_out;
    logic FM_sample_ready;
    
    FM_demod_stage_1 FM_stage_1 (.clk(clk100mhz),.rst(rst),.IF_in(IF_signed),.IF_data_valid(ADC_data_valid),
                                .FM_BP_width(sw[14]),.FM_derivative_out(FM_stage_1_out),.FM_data_valid(FM_sample_ready));
    
    //end FM demod stage 1 ------------------------------------------          
                     
    //AM Demodulation Stage 1 (BP filter)
    //AM Bandpass Filter
    
    //section 1 ------------------------------------------
    //initialize coeffs
    parameter N = 3;
    logic signed [17:0] b1 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a1 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b1 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    assign a1 [(N-2):0] = '{18'sd65380,-18'sd125527}; //a coeff MATLAB: 
    
    logic signed [33:0] filt_sec_1_out;
    logic sec_1_ready;
    
    //triggers on ADC_sample_valid
    AM_BP_Filter #(.N(N)) AM_BP_sec_1 (.clk_in(clk100mhz),.rst(rst),.b(b1),.a(a1),
                .sample_ready(ADC_data_valid),.sample(IF_signed),.filt_out(filt_sec_1_out),.filt_valid(sec_1_ready));
    
    //section 2 ------------------------------------------
    //same N as section 1
    
    logic signed [23:0] filt_sec_2_in;
    //divide output from filter section 1 by 2^11 to fit 24 bit input parameter
    assign filt_sec_2_in = (filt_sec_1_out>>>11);
    
    //initialize coeffs
    logic signed [17:0] b2 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a2 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b2 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    assign a2 [(N-2):0] = '{18'sd65383,-18'sd125680}; //a coeff MATLAB: 
    
    logic signed [33:0] filt_sec_2_out;
    logic sec_2_ready;
    
    AM_BP_Filter #(.N(N)) AM_BP_sec_2 (.clk_in(clk100mhz),.rst(rst),.b(b2),.a(a2),
                .sample_ready(sec_1_ready),.sample(filt_sec_2_in),.filt_out(filt_sec_2_out),.filt_valid(sec_2_ready));
    
    //section 3 ------------------------------------------
    //same N as section 1
    
    logic signed [23:0] filt_sec_3_in;
    //divide output from filter section 1 by 2^11 to fit 24 bit input parameter
    assign filt_sec_3_in = (filt_sec_2_out>>>11);
    
    //initialize coeffs
    logic signed [17:0] b3 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a3 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b3 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    assign a3 [(N-2):0] = '{18'sd65227,-18'sd125456}; //a coeff MATLAB: 
    
    logic signed [33:0] AM_stage_1_out;
    logic AM_sample_ready;
    
    AM_BP_Filter #(.N(N)) AM_BP_sec_3 (.clk_in(clk100mhz),.rst(rst),.b(b3),.a(a3),
                .sample_ready(sec_2_ready),.sample(filt_sec_3_in),.filt_out(AM_stage_1_out),.filt_valid(AM_sample_ready));
   
    //end AM demod stage 1 ------------------------------------------
    
    //AM and FM Demodulation stage 2 (peak detect and audio condition)
    //Modulation_select_sw, sw[5], determines which demod to use (0 = AM, 1 = FM)
    logic signed [33:0] peak_detect_sample_in;
    logic peak_detect_sample_ready;
    always_comb begin
        if (!modulation_select_sw) begin
            peak_detect_sample_ready = AM_sample_ready;
            peak_detect_sample_in = AM_stage_1_out;
        end else begin
            peak_detect_sample_ready = FM_sample_ready;
            peak_detect_sample_in = FM_stage_1_out;
        end
    end
    
    //Peak Detect and Hold
    //magnitude of peak values of signal
    logic [34:0] peak_values;
    logic peak_ready;

    Peak_detect_hold AM_peak_detect (.clk(clk100mhz),.rst(rst),.sample_ready(peak_detect_sample_ready),
                                     .sample_in(peak_detect_sample_in),.peak_value(peak_values),.sample_ready_out(peak_ready));
    
      
    //Audio Condition
    //output to DAC module
    AM_audio_condition condition_AM_for_DAC (.clk(clk100mhz),.rst(rst),.audio_offset(peak_values>>2),.audio_level(sw_audio),
                            .audio_out(DAC_audio_in));
    
    //ila --------------------
    fm_stage_1_ila ila_fm_stage_1 (.clk(clk100mhz),.probe0(filt_sec_6_out),.probe1(filt_sec_5_out));
    //-----------------------  
    
    //end demod stage 2 ------------------------------------------
    
    //Drive DAC with demodulated audio                      
    logic pwm_val;               
    DAC_stuff (.clk_in(clk100mhz), .rst_in(rst), .level_in({~DAC_audio_in[7],DAC_audio_in[6:0]}), .pwm_out(pwm_val));                      
    assign aud_pwm = pwm_val?1'bZ:1'b0; 
     
   
    //------------------------------------------------------------------
    //VGA Stuff
    
    //The height_adjust is used to see what relative height
    //is wanted when displaying signals
    logic [11:0] height_adjust;
    control_height my_height(
                    .clk(clk_65mhz), 
                    .up(encoder2_clk_db), 
                    .down(encoder2_dt_db), 
                    .reset(rst), 
                    .sw(trigger_wanted), 
                    .is_audio(is_audio),
                    .is_fft(is_fft),
                    .height_out(height_adjust));
    
    //The trigger_adjust is used to set the trigger level
    //of the signals.
    logic [11:0] trigger_adjust;
    control_trigger_height my_trigger(
                    .clk(clk_65mhz), 
                    .up(encoder2_clk_db), 
                    .down(encoder2_dt_db), 
                    .reset(rst), 
                    .sw(trigger_wanted), 
                    .is_audio(is_audio), 
                    .is_fft(is_fft),
                    .height_out(trigger_adjust));
    
    //This sets the period we wait between taking samples.
    //Having a higher period lets people see lower frequency 
    //signals
    logic [11:0] period;
    control_period my_period(
                    .clk(clk_65mhz), 
                    .is_fast(is_fast), 
                    .right(encoder1_clk_db), 
                    .left(encoder1_dt_db), 
                    .reset(rst),
                    .is_fft(is_fft), 
                    .period_out(period));
    
    //In the case where we want to display a signal, we 
    //need to decide between the demodulated audio or the
    //raw ADC signal
    logic [11:0] signal_to_display;
    always_comb begin
       //Sets correct signal based on what the user wants
       //to display
       if(is_audio) begin
          signal_to_display = {DAC_audio_in, 4'b0};
       end else begin
          signal_to_display = sample;
       end
    end
    
    //The display signal is what actually gets sent to the
    //display. Why this is different is because we want to
    //buffer our signal between two brams. This lets us see
    //signals of varying frequencies.
    logic [11:0] display_signal;
    trigger_buffer my_buffer(.clock_in(clk_65mhz),.reset_in(rst),
                             .signal_in(signal_to_display),
                             .trigger_height(trigger_adjust),
                             .hcount_in(hcount),.vcount_in(vcount),
                             .period(period),
                             .signal_out(display_signal));
    
    //Based on the display signal, this module gives us what
    //the pixel color should be for any given point on the screen.
    wire [11:0] pixel_function;
    function_pixel_logic plot(.vclock_in(clk_65mhz),.reset_in(rst),
                .height_adjust(height_adjust),
                .signal_in(display_signal),
                .trigger_height(trigger_adjust),
                .hcount_in(hcount),.vcount_in(vcount),
                .is_audio(is_audio),
                .pixel_out(pixel_function));
                
    //A border on the display is created. This is there to auto
    //adjust the display easier
    wire border = (hcount==0 | hcount==1023 | vcount==0 | vcount==767 |
                   hcount == 512 | vcount == 384);

    //Registers for the blanking, horizontal sync, and vertical sync signals.
    //This is here in case there is some pipelining.
    reg b,hs,vs;
    
    
    //FFT Stuff
    // INSTANTIATE SAMPLE FRAME BLOCK RAM 
    // This 16x4096 bram stores the frame of samples
    // The read port is read by the bram_to_fft module and sent to the fft.
    logic fwe;              // Whether or not we want to write to the bram
    logic [11:0] fhead = 0; // Frame head - a pointer to the write point, works as circular buffer
    logic [15:0] fsample;   // The sample data from the ADC
    logic [11:0] faddr;     // Frame address - The read address, controlled by bram_to_fft
    logic [15:0] fdata;     // Frame data - The read data, input into bram_to_fft
    fft_bram bram1 (
        .clka(clk100mhz),
        .wea(fwe),
        .addra(fhead),
        .dina(fsample),
        .clkb(clk100mhz),
        .addrb(faddr),
        .doutb(fdata));
     
    //If the ADC is valid we want to icrement fhead to move to the next
    //position. Will overflow with time.
    always_ff @(posedge clk100mhz) begin
       if (ADC_data_valid) begin
          fhead <= fhead + 1;
       end
    end
    //Write only when we finish a valid sample.
    assign fwe = ADC_data_valid; 
    
    //Switch the input into the bram between the IF and the signal.
    //Used for demonstration purposes.
    always_comb begin
       if(sw[1]) begin
          fsample = IF_out[23:10];
       end else begin
          fsample = {sample, 2'b0};
       end
    end
    
    //SAMPLE FRAME BRAM READ PORT SETUP
    //For this project, we just need to display the FFT on 60Hz video, so let's only send the frame of samples
    //once every 60Hz. 
    
    //Synchronize the vsync to 100mhz since it is on 65mhz
    logic vsync_100mhz, vsync_100mhz_pulse;
    synchronize vsync_synchronize(
        .clk(clk100mhz),
        .in(vsync),
        .out(vsync_100mhz));

    //Since vsync goes low when active, we must invert to make it a pulse.
    level_to_pulse vsync_ltp(
        .clk(clk100mhz),
        .level(~vsync_100mhz),
        .pulse(vsync_100mhz_pulse));
        
    // INSTANTIATE BRAM TO FFT MODULE
    // This module handles the magic of reading sample frames from the BRAM whenever start is asserted,
    // and sending it to the FFT block design over the AXI-stream interface.
    logic last_missing; // All these are control lines to the FFT block design
    logic [31:0] frame_tdata;
    logic frame_tlast, frame_tready, frame_tvalid;
    bram_to_fft bram_to_fft_0(
        .clk(clk100mhz),
        .head(fhead),
        .addr(faddr),
        .data(fdata),
        .start(vsync_100mhz_pulse),
        .last_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid)
    );
    
    // This is the FFT module, implemented as a block design with a 4096pt, 16bit FFT
    // that outputs in magnitude by doing sqrt(Re^2 + Im^2) on the FFT result.
    // It's fully pipelined, so it streams 4096-wide frames of frequency data as fast as
    // you stream in 4096-wide frames of time-domain samples.
    logic [23:0] magnitude_tdata; // This output bus has the FFT magnitude for the current index
    logic [11:0] magnitude_tuser; // This represents the current index being output, from 0 to 4096
    logic magnitude_tlast, magnitude_tvalid;
    fft_mag fft_mag_i(
        .clk(clk100mhz),
        .event_tlast_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid),
        .scaling(12'b011111111000),
        .magnitude_tdata(magnitude_tdata),
        .magnitude_tlast(magnitude_tlast),
        .magnitude_tuser(magnitude_tuser),
        .magnitude_tvalid(magnitude_tvalid));
        
    // Let's only care about the range from index 0 to 1023, which represents frequencies 0 to omega/2
    // where omega is the nyquist frequency (sample rate / 2)
    logic in_range = ~|magnitude_tuser[11:10]; // When 13 and 12 are 0, we're on indexes 0 to 1023
    
    // INSTANTIATE HISTOGRAM BLOCK RAM 
    // This 16x1024 bram stores the histogram data.
    // The write port is written by process_fft.
    // The read port is read by the video outputter or the SD care saver
    // Assign histogram bram read address to histogram module unless saving
    logic [9:0] haddr; // The read port address
    logic [15:0] hdata; // The read port data
    histogram_bram bram2 (
        .clka(clk100mhz),
        .wea(in_range & magnitude_tvalid),  // Only save FFT output if in range and output is valid
        .addra(magnitude_tuser[9:0]),       // The FFT output index, 0 to 1023
        .dina(magnitude_tdata[15:0]),       // The actual FFT magnitude
        .clkb(clk100mhz),  // input wire clkb used to be clk_65mhz
        .addrb(haddr),     // input wire [9 : 0] addrb
        .doutb(hdata)      // output wire [15 : 0] doutb
    );
    
    //This module controls how much we zoom in on the FFT.
    logic [1:0] fft_zoom_mag;
    control_zoom_magnitude my_zoom(
        .clk(clk_65mhz), 
        .up(encoder2_clk_db), 
        .down(encoder2_dt_db), 
        .reset(rst), 
        .is_fft(is_fft), 
        .is_waterfall(is_waterfall),
        .zoom_out(fft_zoom_mag));
        
    //This module controls the offset where we are zooming
    //in on. This in effect determine the windows of our zoom.
    logic [9:0] zoom_offset;
    control_zoom_window my_zoom_window(
        .clk(clk_65mhz),
        .up(encoder1_clk_db),
        .down(encoder1_dt_db),
        .reset(rst),
        .is_fft(is_fft),
        .is_waterfall(is_waterfall),
        .zoom_magnitude(fft_zoom_mag),
        .zoom_pos_out(zoom_offset));
        
    //Module that outputs the pixel for the FFT.
    //Includes other logic for the center frequency line
    //and waterfall display.
    logic [12:0] hist_pixel;
    logic [1:0] hist_range;
    histogram fft_histogram(
        .clk(clk_65mhz),
        .rst(rst),
        .hcount(hcount),
        .vcount(vcount),
        .blank(blank),
        .range_in(fft_zoom_mag), // How much to zoom on the first part of the spectrum
        .vaddr(haddr),
        .vdata(hdata),
        .freq(center_freq_div_20),
        .is_if(sw[1]),
        .is_waterfall(is_waterfall),
        .zoom_offset_in(zoom_offset),
        .pixel(hist_pixel));
        
    // VGA OUTPUT
    always_ff @(posedge clk_65mhz) begin
      //No pipelining so the signals are the same
      hs <= hsync;
      vs <= vsync;
      b <= blank;
      //If we want to display the fft the pixel is
      //whaterver we get from the histogram module
      if(is_fft) begin
         rgb <= hist_pixel;
      end else begin
         //otherwise, if sw[0] is on we want to show
         //our border for display calibration
         if (sw[0]) begin
            rgb <= {12{border}};
         //If not, then we display whatever signal 
         end else begin
            rgb <= pixel_function;
         end
      end
    end
    
    //Assign connector values accordingly.
    assign vga_r = ~b ? rgb[11:8]: 0;
    assign vga_g = ~b ? rgb[7:4] : 0;
    assign vga_b = ~b ? rgb[3:0] : 0;

    assign vga_hs = ~hs;
    assign vga_vs = ~vs;
endmodule