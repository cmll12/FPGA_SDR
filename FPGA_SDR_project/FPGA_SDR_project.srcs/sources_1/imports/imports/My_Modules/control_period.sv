module control_period(
   input clk,
   input right,
   input left,
   input reset,
   output logic [11:0] period_out
   );
   
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter RIGHT_INCREMENT = 3'b100;
   parameter RIGHT_WAIT = 3'b101;
   parameter LEFT_INCREMENT = 3'b111;
   parameter LEFT_WAIT = 3'b011;
   
   logic [2:0] state;
   
   always_ff @(posedge clk) begin
      case(state)
          RESET: begin
             period_out <= 'd0;
             state <= IDLE;
          end
          IDLE: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                if(right) begin
                   state <= RIGHT_INCREMENT;
                end else begin
                   if(left) begin
                      state <= LEFT_INCREMENT;
                  end
               end
             end
          end
          RIGHT_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(period_out <= 'd3950) begin
                   period_out <= period_out + 1;
                   state <= RIGHT_WAIT;
                end else begin
                   state <= IDLE;
                end
             end
          end
          RIGHT_WAIT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(!right) begin
                   state <= IDLE;
                end
             end
          end
          LEFT_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(period_out >= 1) begin
                   period_out <= period_out - 1;
                   state <= LEFT_WAIT;
                end else begin
                   state <= IDLE;
                end
             end
          end
          LEFT_WAIT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(!left) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule
