module control_height(
   input clk,
   input up,
   input down,
   input reset,
   input sw,
   output logic [11:0] height_out
   );
   
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter UP_INCREMENT = 3'b100;
   parameter UP_WAIT = 3'b101;
   parameter DOWN_INCREMENT = 3'b111;
   parameter DOWN_WAIT = 3'b011;
   
   logic [2:0] state;
   
   always_ff @(posedge clk) begin
      case(state)
        RESET: begin
          height_out <= 100;
          state <= IDLE;
        end
          IDLE: begin
          if(reset) begin
             state <= RESET;
             end else begin
                if(up & !sw) begin
                   state <= UP_INCREMENT;
                end else begin
                if(down & !sw) begin
                   state <= DOWN_INCREMENT;
                end
             end
          end
          end
          UP_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(height_out <= 'd380) begin
                   height_out <= height_out + 10;
                   state <= UP_WAIT;
                end else begin
                   state <= IDLE;
                end
             end
          end
          UP_WAIT: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                 if(!up) begin
                     state <= IDLE;
                 end
             end
          end
          DOWN_INCREMENT: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                 if(height_out >= 15) begin
                    height_out <= height_out - 10;
                    state <= DOWN_WAIT;
                 end else begin
                    state <= IDLE;
                 end
             end
          end
          DOWN_WAIT: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                 if(!down) begin
                     state <= IDLE;
                 end
             end
          end
          default: state <= RESET;
       endcase
   end
endmodule
