module control_center_frequency(
   input clk,
   input right,
   input left,
   input reset,
   input is_fast,
   output logic [17:0] center_frequency_out
   );
   
   //States for the state machine
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter RIGHT_INCREMENT = 3'b011;
   parameter LEFT_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   //Registers to hold the state
   logic [2:0] state;
   
   always_ff @(posedge clk) begin
      case(state)
          //Reset the center frequency on reset.
          RESET: begin
             center_frequency_out <= 18'd30_000;
             state <= IDLE;
          end
          IDLE: begin
             //If reset, then go back to reset state
             if(reset) begin
                 state <= RESET;
             end else begin
                //If right goes low we are turning
                //clockwise and need to increment up,
                if(!right) begin
                   state <= RIGHT_INCREMENT;
                end else begin
                   //If left goes low we are turning 
                   //counter-clockwise and need to 
                   //increment down.
                   if(!left) begin
                      state <= LEFT_INCREMENT;
                  end
               end
             end
          end
          RIGHT_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //If in fast mode, we will change our center frequency faster
                //per increment.
                if(is_fast) begin
                   //Make sure we aren't above our highest possible frequency
                   if(center_frequency_out <= 18'd249_699) begin
                      center_frequency_out <= center_frequency_out + 'd300;
                   end
                end else begin
                   //Make sure we aren't above our highest possible frequency
                   if(center_frequency_out <= 18'd249_999) begin
                      center_frequency_out <= center_frequency_out + 'd25;
                   end
                end
                state <= WAIT_NORMAL;
             end
          end
          LEFT_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                //If in fast mode, we will change our center frequency faster
                //per increment.
                if(is_fast) begin
                   //Make sure we aren't below our lowest possible frequency
                   if(center_frequency_out >= 'd25_300) begin
                      center_frequency_out <= center_frequency_out - 'd300;
                   end
                end else begin
                   //Make sure we aren't below our lowest possible frequency
                   if(center_frequency_out >= 'd25_001) begin
                      center_frequency_out <= center_frequency_out - 'd25;
                   end
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
                if(left & right) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule

