module control_trigger_height(
   input clk,
   input up,
   input down,
   input reset,
   input sw,
   input is_audio,
   input is_fft,
   output logic [11:0] height_out
   );
   
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter UP_INCREMENT = 3'b011;
   parameter DOWN_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   logic [2:0] state_signal;
   logic [2:0] state_audio;
   
   logic [11:0] height_out_signal;
   logic [11:0] height_out_audio;
   
   
   always_ff @(posedge clk) begin
      if(!is_audio) begin
          case(state_signal)
              RESET: begin
                 height_out_signal <= 'd1500;
                 state_signal <= IDLE;
              end
              IDLE: begin
                 if(reset) begin
                     state_signal <= RESET;
                 end else begin
                    if(!up && !sw && !is_fft) begin
                       state_signal <= UP_INCREMENT;
                    end else begin
                       if(!down && !sw && !is_fft) begin
                          state_signal <= DOWN_INCREMENT;
                      end
                   end
                 end
              end
              UP_INCREMENT: begin
                 if(reset) begin
                    state_signal <= RESET;
                 end else begin
                    if(height_out_signal <= 'd3950) begin
                       height_out_signal <= height_out + 'd50;
                    end
                    state_signal <= WAIT_NORMAL;
                 end
              end
              DOWN_INCREMENT: begin
                 if(reset) begin
                    state_signal <= RESET;
                 end else begin
                    if(height_out_signal >= 55) begin
                       height_out_signal <= height_out - 'd50;
                    end
                    state_signal <= WAIT_NORMAL;
                 end
              end
              WAIT_NORMAL: begin
                 if(reset) begin
                    state_signal <= RESET;
                 end else begin
                    if(up & down & !sw && !is_fft) begin
                       state_signal <= IDLE;
                    end
                 end
              end
              default: state_signal <= RESET;
          endcase
      end else begin
          case(state_audio)
              RESET: begin
                 height_out_audio <= 'd53;
                 state_audio <= IDLE;
              end
              IDLE: begin
                 if(reset) begin
                     state_audio <= RESET;
                 end else begin
                    if(!up && !sw && !is_fft) begin
                       state_audio <= UP_INCREMENT;
                    end else begin
                       if(!down && !sw && !is_fft) begin
                          state_audio <= DOWN_INCREMENT;
                      end
                   end
                 end
              end
              UP_INCREMENT: begin
                 if(reset) begin
                    state_audio <= RESET;
                 end else begin
                    if(height_out_audio <= 'd3950) begin
                       height_out_audio <= height_out + 'd50;
                    end 
                    state_audio <= WAIT_NORMAL;
                 end
              end
              DOWN_INCREMENT: begin
                 if(reset) begin
                    state_audio <= RESET;
                 end else begin
                    if(height_out_audio >= 53) begin
                       height_out_audio <= height_out - 'd50;
                    end
                    state_audio <= WAIT_NORMAL;
                 end
              end
              WAIT_NORMAL: begin
                 if(reset) begin
                    state_audio <= RESET;
                 end else begin
                    if(up & down & !sw && !is_fft) begin
                       state_audio <= IDLE;
                    end
                 end
              end
              default: state_audio <= RESET;
          endcase
      end
   end
   
   assign height_out = is_audio ? height_out_audio : height_out_signal;
   /*
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
             height_out <= 'd1500;
             state <= IDLE;
          end
          IDLE: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                if(up & sw) begin
                   state <= UP_INCREMENT;
                end else begin
                   if(down & sw) begin
                      state <= DOWN_INCREMENT;
                  end
               end
             end
          end
          UP_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(height_out <= 'd3950) begin
                   height_out <= height_out + 50;
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
                if(height_out >= 55) begin
                   height_out <= height_out - 50;
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
   */
endmodule
