`timescale 1ns / 1ps
module control_zoom_window(
   input clk,
   input up,
   input down,
   input reset,
   input is_fft,
   input is_waterfall,
   input [1:0] zoom_magnitude,
   output logic [9:0] zoom_pos_out
   );
   
   //States for the state machine
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter UP_INCREMENT = 3'b011;
   parameter DOWN_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   //Three seperate state machines all for the
   //different zoom levels.
   logic [2:0] state_01;
   logic [9:0] zoom_out_01;
   
   logic [2:0] state_10;
   logic [9:0] zoom_out_10;
   
   logic [2:0] state_11;
   logic [9:0] zoom_out_11;
   
   
   always_ff @(posedge clk) begin
      case(zoom_magnitude)
         //No zoom means we can't alter the offset
         2'b00: zoom_pos_out <= 0;
         2'b01: begin
            case(state_01)
              //Reset Variables
              RESET: begin
                 zoom_out_01 <= 'd0  ;
                 state_01 <= IDLE;
              end
              IDLE: begin
                 //If reset, then go back to reset state
                 if(reset) begin
                     state_01 <= RESET;
                 end else begin
                    //If up goes low we are turning
                    //clockwise and need to increment up.
                    //Check to make sure that fft mode is
                    //enabled and waterfall isn't.
                    if(!up & is_fft & !is_waterfall) begin
                       state_01 <= UP_INCREMENT;
                    end else begin
                       //If down goes low we are turning 
                       //counter-clockwise and need to 
                       //increment down. Check to make sure
                       //that fft mode is enabled and 
                       //waterfall isn't
                       if(!down & is_fft & !is_waterfall) begin
                          state_01 <= DOWN_INCREMENT;
                      end
                   end
                 end
              end
              UP_INCREMENT: begin
                 if(reset) begin
                    state_01 <= RESET;
                 end else begin
                     //Make sure we don't past our maximum.
                    if(zoom_out_01 < 'd503) begin
                       zoom_out_01 <= zoom_out_01 + 'd10;
                    end
                    state_01 <= WAIT_NORMAL;
                 end
              end
              DOWN_INCREMENT: begin
                 if(reset) begin
                    state_01 <= RESET;
                 end else begin
                     //Make sure we don't get a negative offset.
                    if(zoom_out_01 > 'd9) begin
                       zoom_out_01 <= zoom_out_01 - 'd10;
                    end
                    state_01 <= WAIT_NORMAL;
                 end
              end
              WAIT_NORMAL: begin
                 if(reset) begin
                    state_01 <= RESET;
                 end else begin
                    //Wait until our signals both go high
                    //signifying we are idle again.
                    if(up & down & is_fft & !is_waterfall) begin
                       state_01 <= IDLE;
                    end
                 end
              end
              default: state_01 <= RESET;
          endcase
          //Set the position out to the current scale.
          zoom_pos_out <= zoom_out_01;
       end
       //Same as above with different limits
       2'b10: begin
          case(state_10)
              RESET: begin
                 zoom_out_10 <= 'd0;
                 state_10 <= IDLE;
              end
              IDLE: begin
                 if(reset) begin
                     state_10 <= RESET;
                 end else begin
                    if(!up & is_fft & !is_waterfall) begin
                       state_10 <= UP_INCREMENT;
                    end else begin
                       if(!down & is_fft & !is_waterfall) begin
                          state_10 <= DOWN_INCREMENT;
                      end
                   end
                 end
              end
              UP_INCREMENT: begin
                 if(reset) begin
                    state_10 <= RESET;
                 end else begin
                    if(zoom_out_10 < 'd779) begin
                       zoom_out_10 <= zoom_out_10 + 'd20;
                    end
                    state_10 <= WAIT_NORMAL;
                 end
              end
              DOWN_INCREMENT: begin
                 if(reset) begin
                    state_10 <= RESET;
                 end else begin
                    if(zoom_out_10 > 'd19) begin
                       zoom_out_10 <= zoom_out_10 - 'd20;
                    end
                    state_10 <= WAIT_NORMAL;
                 end
              end
              WAIT_NORMAL: begin
                 if(reset) begin
                    state_10 <= RESET;
                 end else begin
                    if(up & down & is_fft & !is_waterfall) begin
                       state_10 <= IDLE;
                    end
                 end
              end
              default: state_10 <= RESET;
          endcase
          zoom_pos_out <= zoom_out_10;
       end
       //Same as above with different limits.
       2'b11: begin
          case(state_11)
              RESET: begin
                 zoom_out_11 <= 'd0  ;
                 state_11 <= IDLE;
              end
              IDLE: begin
                 if(reset) begin
                     state_11 <= RESET;
                 end else begin
                    if(!up & is_fft & !is_waterfall) begin
                       state_11 <= UP_INCREMENT;
                    end else begin
                       if(!down & is_fft & !is_waterfall) begin
                          state_11 <= DOWN_INCREMENT;
                      end
                   end
                 end
              end
              UP_INCREMENT: begin
                 if(reset) begin
                    state_11 <= RESET;
                 end else begin
                    if(zoom_out_11 < 'd867) begin
                       zoom_out_11 <= zoom_out_11 + 'd30;
                    end
                    state_11 <= WAIT_NORMAL;
                 end
              end
              DOWN_INCREMENT: begin
                 if(reset) begin
                    state_11 <= RESET;
                 end else begin
                    if(zoom_out_11 > 'd29) begin
                       zoom_out_11 <= zoom_out_11 - 'd30;
                    end
                    state_11 <= WAIT_NORMAL;
                 end
              end
              WAIT_NORMAL: begin
                 if(reset) begin
                    state_11 <= RESET;
                 end else begin
                    if(up & down & is_fft & !is_waterfall) begin
                       state_11 <= IDLE;
                    end
                 end
              end
              default: state_11 <= RESET;
          endcase
          zoom_pos_out <= zoom_out_11;
       end
      endcase
   end
endmodule
