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
        //if 1, use wideband FM, if 0, use narrowband FM
        input FM_BP_width,
        //derivative of band passed FM signal
        output logic signed [33:0] FM_derivative_out,
        output logic FM_data_valid
    );
    
    parameter N = 3;
    logic signed [17:0] a1 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    logic signed [17:0] a2 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    logic signed [17:0] a3 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    logic signed [17:0] a4 [(N-2):0]; //N-1 feedback coeffs [a(N-1)...a1], unpacked array
    
    //select NFM or WFM
    always_comb begin
        if (FM_BP_width) begin
            //FM (Wideband) Bandpass Filter
            a1 [(N-2):0] = '{18'sd61600,-18'sd119464}; //a coeff MATLAB: 
            a2 [(N-2):0] = '{18'sd62943,-18'sd125245}; //a coeff MATLAB: 
            a3 [(N-2):0] = '{18'sd57240,-18'sd117002}; //a coeff MATLAB: 
            a4 [(N-2):0] = '{18'sd58551,-18'sd120066}; //a coeff MATLAB: 
        end else begin
            //FM (narrowband) bandpass filter
            a1 [(N-2):0] = '{18'sd64789,-18'sd124533}; //a coeff MATLAB: 
            a2 [(N-2):0] = '{18'sd64853,-18'sd125569}; //a coeff MATLAB: 
            a3 [(N-2):0] = '{18'sd63792,-18'sd123882}; //a coeff MATLAB: 
            a4 [(N-2):0] = '{18'sd63855,-18'sd124342}; //a coeff MATLAB: 
        end //if narrow or wide    
    end //always_comb
    
    //section 1 ------------------------------------------
    //initialize coeffs
    logic signed [17:0] b1 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array

    assign b1 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    
    logic signed [33:0] filt_sec_1_out;
    logic sec_1_ready;

    AM_BP_Filter #(.N(N)) FM_BP_sec_1 (.clk_in(clk),.rst(rst),.b(b1),.a(a1),
                .sample_ready(IF_data_valid),.sample(IF_in),.filt_out(filt_sec_1_out),.filt_valid(sec_1_ready));
            
    //section 2 ------------------------------------------
    logic signed [23:0] filt_sec_2_in;
    //divide output from filter section 1 by 2^5 to fit 24 bit input parameter
    assign filt_sec_2_in = (filt_sec_1_out>>>5);
     
    //initialize coeffs
    logic signed [17:0] b2 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    
    assign b2 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    
    logic signed [33:0] filt_sec_2_out;
    logic sec_2_ready;
    
    AM_BP_Filter #(.N(N)) FM_BP_sec_2 (.clk_in(clk),.rst(rst),.b(b2),.a(a2),
                .sample_ready(sec_1_ready),.sample(filt_sec_2_in),.filt_out(filt_sec_2_out),.filt_valid(sec_2_ready));
    
    //section 3 ------------------------------------------
    logic signed [23:0] filt_sec_3_in;
    //divide output from filter section 1 by 2^5 to fit 24 bit input parameter
    assign filt_sec_3_in = (filt_sec_2_out>>>5);
    
    //initialize coeffs
    logic signed [17:0] b3 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    
    assign b3 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    
    logic signed [33:0] filt_sec_3_out;
    logic sec_3_ready;
    
    AM_BP_Filter #(.N(N)) FM_BP_sec_3 (.clk_in(clk),.rst(rst),.b(b3),.a(a3),
                .sample_ready(sec_2_ready),.sample(filt_sec_3_in),.filt_out(filt_sec_3_out),.filt_valid(sec_3_ready));
    
    
     //section 4 ------------------------------------------
    logic signed [23:0] filt_sec_4_in;
    //divide output from filter section 1 by 2^5 to fit 24 bit input parameter
    assign filt_sec_4_in = (filt_sec_3_out>>>5);
    
    //initialize coeffs
    logic signed [17:0] b4 [(N-1):0]; //N b feedforward coeffs [b(N-1)...b0), unpacked array
    
    assign b4 [(N-1):0] = '{-18'sd65536,18'sd0,18'sd65536}; //b coeff MATLAB: [1,0,-1]
    
    logic signed [33:0] filt_sec_4_out;
    logic sec_4_ready;
    
    //triggers on ADC_sample_valid
    AM_BP_Filter #(.N(N)) FM_BP_sec_4 (.clk_in(clk),.rst(rst),.b(b4),.a(a4),
                .sample_ready(sec_3_ready),.sample(filt_sec_4_in),.filt_out(filt_sec_4_out),.filt_valid(sec_4_ready));
   
    
    
    //FM signal derivative with respect to time
    //stores previous value from last section in FM bandpass
    logic signed [33:0] past_filt_4_out;
    logic signed [33:0] past_past_filt_4_out;
    logic signed [33:0] past_FM_derivative;
    logic signed [33:0] FM_derivative;
    
    //Calculates derivative of band passed FM signal to pass into peak detection for smoothing
    //operates at constant sampling freq therefore d(FM_signal)/d(t) = current_val - past_val / t
    //and dividing by time doesn't matter so can ignore (constant)
    always_ff @(posedge clk) begin
        if (rst) begin
            past_filt_4_out <= 0;
            past_past_filt_4_out <=0;
            past_FM_derivative <= 0;
            FM_derivative <= 0;
            FM_derivative_out <=0;
            FM_data_valid <= 0;
        end else begin
            if (sec_4_ready) begin
                past_past_filt_4_out <= past_filt_4_out;
                past_filt_4_out <= filt_sec_4_out;
                //calc derivative and past derivative
                past_FM_derivative <= past_filt_4_out - past_past_filt_4_out;
                FM_derivative <= filt_sec_4_out - past_filt_4_out;
                //current derivative out averaged over past 2
                FM_derivative_out <= (FM_derivative >>> 2) + (past_FM_derivative >>> 2);
                //trigger data valid. Will occur at 10 MHz
                FM_data_valid <= 1;
            end else begin
                //waiting for data so data_valid = 0
                FM_data_valid <= 0;
            end
        end //rst else
    end //always_ff
   
    
endmodule
