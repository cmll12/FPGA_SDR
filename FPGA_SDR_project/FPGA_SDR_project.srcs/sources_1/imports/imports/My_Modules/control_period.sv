module control_period(
   input clk,
   input right,
   input left,
   input reset,
   input is_fast,
   input is_fft,
   output logic [11:0] period_out
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
          //Reset the correct variables
          RESET: begin
             period_out <= 'd0;
             state <= IDLE;
          end
          IDLE: begin
             //If reset, then go back to reset state
             if(reset) begin
                 state <= RESET;
             end else begin
                //If right goes low we are turning
                //clockwise and need to increment up.
                //Check to make sure that fft mode isn't
                //enabled.
                if(!right && !is_fft) begin
                   state <= RIGHT_INCREMENT;
                end else begin
                   //If left goes low we are turning 
                   //counter-clockwise and need to 
                   //increment down. Check to make sure
                   //that fft mode isn't enabled
                   if(!left && !is_fft) begin
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
                if(!is_fast) begin
                   //Make sure our period isn't too high
                   if(period_out <= 'd3950) begin
                      period_out <= period_out + 1;
                   end
                end else begin
                   //Make sure our period isn't too high
                   if(period_out <= 'd3930) begin
                      period_out <= period_out + 'd20;
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
                if(!is_fast) begin
                   //Make sure we don't get a negative period.                                                                                                              
                   if(period_out >= 1) begin
                      period_out <= period_out - 1;
                   end
                end else begin
                   //Make sure we don't get a negative period.  
                   if(period_out >= 20) begin
                      period_out <= period_out - 'd20;
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
                if(left & right && !is_fft) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule