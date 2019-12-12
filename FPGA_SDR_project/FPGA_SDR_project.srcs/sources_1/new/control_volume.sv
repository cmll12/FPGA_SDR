module control_volume(
   input clk,
   input up,
   input down,
   input reset,
   input signed [7:0] DAC_in,
   output logic [4:0] volume_out
   );
   
   //States for the state machine
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter UP_INCREMENT = 3'b011;
   parameter DOWN_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   //Registers to hold the state
   logic [2:0] state;
   
   //Variable to tell if we have reached our maximum volume.
   logic is_max;
   
   always_ff @(posedge clk) begin
      case(state)
          RESET: begin
             //Set important variables to 0
             is_max <= 0;
             volume_out <= 'd0;
             state <= IDLE;
          end
          IDLE: begin
             //If our DAC value is really high, we
             //have gone above our maximum value.
             if(DAC_in > 'sd64) begin
                is_max <= 1;
             end
             //If reset, then go back to reset state
             if(reset) begin
                 state <= RESET;
             end else begin
                //If up goes low we are turning
                //clockwise and need to increment up,
                if(!up) begin
                   state <= UP_INCREMENT;
                end else begin
                   //If down goes low we are turning 
                   //counter-clockwise and need to 
                   //increment down.
                   if(!down) begin
                      state <= DOWN_INCREMENT;
                  end
               end
             end
          end
          UP_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //Make sure we aren't above our highest possible bit shift
                if(volume_out < 'd26 && !is_max) begin
                   volume_out <= volume_out + 1;
                end
                state <= WAIT_NORMAL;
             end
          end
          DOWN_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //Make sure we don't do a negative bit shift
                if(volume_out > 'd0) begin
                   volume_out <= volume_out - 1;
                end
                is_max <= 0;
                state <= WAIT_NORMAL;
             end
          end
          WAIT_NORMAL: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //Wait until our signals both go high
                //signifying we are idle again.
                if(up & down) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule
