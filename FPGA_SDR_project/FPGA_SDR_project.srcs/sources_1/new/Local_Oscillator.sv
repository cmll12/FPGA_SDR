//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 11/20/2019 10:50:05 PM
// Design Name: 
// Module Name: Local_Oscillator & sine_lut

module Local_Oscillator(
           input clk_in,
           input rst,
           input [17:0] center_freq_div_20,
           output logic [11:0] LO_out
    );
    
    //Intermediate freq of radio / 20. typical AM receiver uses 455 kHz
    parameter IF_FREQ_div_20 = 18'd22_750;
    
    //desired frequency of LO output signal / 20
    logic [17:0] LO_freq_div_20;
    //center_freq should be 18 bit value for approx 20 Hz resolution up to 5 MHz
    assign LO_freq_div_20 = center_freq_div_20 - IF_FREQ_div_20;
    
    //Parameter to convert desired frequency to phase increments.
    //A = round( (2^32 - 1)/f_clk * 2^8 )
    parameter A = 13744;
    logic [31:0] phase_inc;
    assign phase_inc = (LO_freq_div_20 * A) >> 4;

    logic [31:0] phase;
    //phase[31:24] = 8 bits range for sine wave look up table in memory
    //returns 12 bit value from memory intialized with sine wave [0,4095]
    sine_wave LO_sine_wave (.clka(clk_in), .addra(phase[31:24]), .douta(LO_out));
    
    //increment phase on rising edge of 100 MHz clk
    always_ff @(posedge clk_in)begin
        if (rst)begin
            phase <= 32'b0;
        end else begin
            phase <= phase + phase_inc;
        end
    end
    
endmodule
