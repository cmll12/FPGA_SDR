module control_height(
   input clk,
   input up,
   input down,
   input reset,
   input sw,
   input is_audio,
   input is_fft,
   output logic [11:0] height_out
   );
   
    //States for the state machines
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter UP_INCREMENT = 3'b011;
   parameter DOWN_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   //Two seperate state machines with two different
   //outputs. We do this so that the values don't
   //interfere with each other.
   logic [2:0] state_signal;
   logic [2:0] state_audio;
   
   logic [11:0] height_out_signal;
   logic [11:0] height_out_audio;
   
   
   always_ff @(posedge clk) begin
      //If we aren't displaying audio, we are
      //only adjusting the height of the raw
      //ADC signal.
      if(!is_audio) begin
          case(state_signal)
              RESET: begin
                 //Set important variables to 0
                 height_out_signal <= 'd100;
                 state_signal <= IDLE;
              end
              IDLE: begin
                 //If reset, then go back to reset state
                 if(reset) begin
                     state_signal <= RESET;
                 end else begin
                    //If up goes low we are turning
                    //clockwise and need to increment up.
                    //Check to make sure fft mode isn't
                    //on.
                    if(!up && sw && !is_fft) begin
                       state_signal <= UP_INCREMENT;
                    end else begin
                       //If down goes low we are turning 
                       //counter-clockwise and need to 
                       //increment down. Check to make
                       //sure fft mode isn't on.
                       if(!down && sw && !is_fft) begin
                          state_signal <= DOWN_INCREMENT;
                      end
                   end
                 end
              end
              UP_INCREMENT: begin
                 if(reset) begin
                    state_signal <= RESET;
                 end else begin
                    //Make sure we aren't above our highest possible height.
                    //raw ADC signal has less height since the signal is stronger.
                    if(height_out_signal <= 'd380) begin
                       height_out_signal <= height_out + 'd10;
                    end
                    state_signal <= WAIT_NORMAL;
                 end
              end
              DOWN_INCREMENT: begin
                 if(reset) begin
                    state_signal <= RESET;
                 end else begin
                    //Make sure we dont have a 0 height
                    if(height_out_signal >= 'd15) begin
                       height_out_signal <= height_out - 'd10;
                    end
                    state_signal <= WAIT_NORMAL;
                 end
              end
              WAIT_NORMAL: begin
                 if(reset) begin
                    state_signal <= RESET;
                 end else begin
                    //Wait until our signals both go high
                    //signifying we are idle again.
                    if(up & down & sw && !is_fft) begin
                       state_signal <= IDLE;
                    end
                 end
              end
              default: state_signal <= RESET;
          endcase
      //State machine for displaying audio. Same as above.
      end else begin
          case(state_audio)
              RESET: begin
                 height_out_audio <= 'd300;
                 state_audio <= IDLE;
              end
              IDLE: begin
                 if(reset) begin
                     state_audio <= RESET;
                 end else begin
                    if(!up && sw && !is_fft) begin
                       state_audio <= UP_INCREMENT;
                    end else begin
                       if(!down && sw && !is_fft) begin
                          state_audio <= DOWN_INCREMENT;
                      end
                   end
                 end
              end
              UP_INCREMENT: begin
                 if(reset) begin
                    state_audio <= RESET;
                 end else begin
                    //Has a higher cap and more movement per turn.
                    if(height_out_audio <= 'd500) begin
                       height_out_audio <= height_out + 'd20;
                    end 
                    state_audio <= WAIT_NORMAL;
                 end
              end
              DOWN_INCREMENT: begin
                 if(reset) begin
                    state_audio <= RESET;
                 end else begin
                    if(height_out_audio >= 3) begin
                       height_out_audio <= height_out - 'd20;
                    end
                    state_audio <= WAIT_NORMAL;
                 end
              end
              WAIT_NORMAL: begin
                 if(reset) begin
                    state_audio <= RESET;
                 end else begin
                    if(up & down & sw && !is_fft) begin
                       state_audio <= IDLE;
                    end
                 end
              end
              default: state_audio <= RESET;
          endcase
      end
   end
   
   //Assign the actual height out based upon which state machine is being used.
   assign height_out = is_audio ? height_out_audio : height_out_signal;
endmodule