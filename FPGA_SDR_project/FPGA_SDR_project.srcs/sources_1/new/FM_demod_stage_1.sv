//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 12/07/2019 08:19:57 PM
// Design Name: 
// Module Name: FM_demod_stage_1
//////////////////////////////////////////////////////////////////////////////////

module FM_demod_stage_1(
        input clk,
        input rst,
        //ouput from RF mixer
        input signed [23:0] IF_in,
        //driven by ADC_data_valid
        input IF_data_valid,
        //derivative of band passed FM signal
        output logic signed [33:0] FM_derivative,
        output logic FM_data_valid
    );
       
    //ila --------------------
    fm_stage_1_ila ila_fm_stage_1 (.clk(clk),.probe0(IF_in),.probe1(FM_derivative));
    //-----------------------
    
    //FM (Wideband) Bandpass Filter
    
    //section 1 ------------------------------------------
    //initialize coeffs
    parameter N = 3;
    logic signed [17:0] b1 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a1 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b1 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    assign a1 [(N-2):0] = '{18'sd61600,-18'sd119464}; //a coeff MATLAB: 
    
    logic signed [33:0] filt_sec_1_out;
    logic sec_1_ready;
    
    //triggers on ADC_sample_valid
    AM_BP_Filter #(.N(N)) FM_BP_sec_1 (.clk_in(clk),.rst(rst),.b(b1),.a(a1),
                .sample_ready(IF_data_valid),.sample(IF_in),.filt_out(filt_sec_1_out),.filt_valid(sec_1_ready));
            
    //section 2 ------------------------------------------
    logic signed [23:0] filt_sec_2_in;
    //divide output from filter section 1 by 2^5 to fit 24 bit input parameter
    assign filt_sec_2_in = (filt_sec_1_out>>>5);
     
    //initialize coeffs
    logic signed [17:0] b2 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a2 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b2 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    assign a2 [(N-2):0] = '{18'sd62943,-18'sd125245}; //a coeff MATLAB: 
    
    logic signed [33:0] filt_sec_2_out;
    logic sec_2_ready;
    
    //triggers on ADC_sample_valid
    AM_BP_Filter #(.N(N)) FM_BP_sec_2 (.clk_in(clk),.rst(rst),.b(b2),.a(a2),
                .sample_ready(sec_1_ready),.sample(filt_sec_2_in),.filt_out(filt_sec_2_out),.filt_valid(sec_2_ready));
    
    //section 3 ------------------------------------------
    logic signed [23:0] filt_sec_3_in;
    //divide output from filter section 1 by 2^5 to fit 24 bit input parameter
    assign filt_sec_3_in = (filt_sec_2_out>>>5);
    
    //initialize coeffs
    logic signed [17:0] b3 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a3 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b3 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    assign a3 [(N-2):0] = '{18'sd57240,-18'sd117002}; //a coeff MATLAB: 
    
    logic signed [33:0] filt_sec_3_out;
    logic sec_3_ready;
    
    //triggers on ADC_sample_valid
    AM_BP_Filter #(.N(N)) FM_BP_sec_3 (.clk_in(clk),.rst(rst),.b(b3),.a(a3),
                .sample_ready(sec_2_ready),.sample(filt_sec_3_in),.filt_out(filt_sec_3_out),.filt_valid(sec_3_ready));
    
    
     //section 4 ------------------------------------------
    logic signed [23:0] filt_sec_4_in;
    //divide output from filter section 1 by 2^5 to fit 24 bit input parameter
    assign filt_sec_4_in = (filt_sec_3_out>>>5);
    
    //initialize coeffs
    logic signed [17:0] b4 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    logic signed [17:0] a4 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    assign b4 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    assign a4 [(N-2):0] = '{18'sd58551,-18'sd120066}; //a coeff MATLAB: 
    
    logic signed [33:0] filt_sec_4_out;
    logic sec_4_ready;
    
    //triggers on ADC_sample_valid
    AM_BP_Filter #(.N(N)) FM_BP_sec_4 (.clk_in(clk),.rst(rst),.b(b4),.a(a4),
                .sample_ready(sec_3_ready),.sample(filt_sec_4_in),.filt_out(filt_sec_4_out),.filt_valid(sec_4_ready));
   
    
    
    //FM signal derivative with respect to time
    //stores previous value from last section in FM bandpass
    logic signed [33:0] past_filt_4_out;
    
    //Calculates derivative of band passed FM signal to pass into peak detection
    //operates at constant sampling freq therefore d(FM_signal)/d(t) = current_val - past_val / t
    //and dividing by time doesn't matter so can ignore (constant)
    always_ff @(posedge clk) begin
        if (rst) begin
            past_filt_4_out <= 0;
            FM_derivative <= 0;
            FM_data_valid <= 0;
        end else begin
            if (sec_4_ready) begin
                past_filt_4_out <= filt_sec_4_out;
                FM_derivative <= filt_sec_4_out - past_filt_4_out;
                //trigger data valid. Will occur at 10 MHz
                FM_data_valid <= 1;
            end else begin
                //waiting for data so data_valid = 0
                FM_data_valid <= 0;
            end
        end //rst else
    end //always_ff
    
endmodule
