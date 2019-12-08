module control_center_frequency(
   input clk,
   input right,
   input left,
   input reset,
   input is_fast,
   output logic [17:0] center_frequency_out
   );
   
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter RIGHT_INCREMENT = 3'b011;
   parameter LEFT_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   logic [2:0] state;
   
   always_ff @(posedge clk) begin
      case(state)
          RESET: begin
             center_frequency_out <= 18'd30_000;
             state <= IDLE;
          end
          IDLE: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                if(!right) begin
                   state <= RIGHT_INCREMENT;
                end else begin
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
                if(is_fast) begin
                   if(center_frequency_out <= 18'd249_950) begin
                      center_frequency_out <= center_frequency_out + 'd50;
                   end
                end else begin
                   if(center_frequency_out <= 18'd249_999) begin
                      center_frequency_out <= center_frequency_out + 1;
                   end
                end
                state <= WAIT_NORMAL;
             end
          end
          LEFT_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(is_fast) begin
                   if(center_frequency_out >= 'd25_050) begin
                      center_frequency_out <= center_frequency_out - 'd50;
                   end
                end else begin
                   if(center_frequency_out >= 'd25_001) begin
                      center_frequency_out <= center_frequency_out - 1;
                   end
                end
                state <= WAIT_NORMAL;
             end
          end
          WAIT_NORMAL: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(left & right) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule

