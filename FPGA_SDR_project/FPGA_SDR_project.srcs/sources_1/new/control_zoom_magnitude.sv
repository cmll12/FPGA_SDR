`timescale 1ns / 1ps
module control_zoom_magnitude(
   input clk,
   input up,
   input down,
   input reset,
   input is_fft,
   input is_waterfall,
   output logic [1:0] zoom_out
   );
   
   //States for the state machine
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter UP_INCREMENT = 3'b011;
   parameter DOWN_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   //Registers to hold the state
   logic [2:0] state;
   
   always_ff @(posedge clk) begin
      case(state)
          RESET: begin
             //Reset the correct variables
             zoom_out <= 'd0;
             state <= IDLE;
          end
          IDLE: begin
             //If reset, then go back to reset state
             if(reset) begin
                 state <= RESET;
             end else begin
                //If up goes low we are turning
                //clockwise and need to increment up.
                //Check to make sure that fft mode is
                //enabled and waterfall isn't.
                if(!up & is_fft & !is_waterfall) begin
                   state <= UP_INCREMENT;
                end else begin
                   //If down goes low we are turning 
                   //counter-clockwise and need to 
                   //increment down. Check to make sure
                   //that fft mode is enabled and 
                   //waterfall isn't
                   if(!down & is_fft & !is_waterfall) begin
                      state <= DOWN_INCREMENT;
                  end
               end
             end
          end
          UP_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //Make sure our zoom isn't at it's max
                if(zoom_out < 'd3) begin
                   zoom_out <= zoom_out + 1;
                end
                state <= WAIT_NORMAL;
             end
          end
          DOWN_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //Make sure zoom doen'st overflow
                if(zoom_out > 'd0) begin
                   zoom_out <= zoom_out - 1;
                end
                state <= WAIT_NORMAL;
             end
          end
          WAIT_NORMAL: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //Wait until our signals both go high
                //signifying we are idle again.
                if(up & down & is_fft & !is_waterfall) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule
