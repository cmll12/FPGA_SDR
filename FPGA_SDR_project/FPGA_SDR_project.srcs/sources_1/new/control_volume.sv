module control_volume(
   input clk,
   input up,
   input down,
   input reset,
   output logic [4:0] volume_out
   );
   
   parameter RESET = 3'b000;
   parameter IDLE = 3'b001;
   parameter UP_INCREMENT = 3'b011;
   parameter DOWN_INCREMENT = 3'b111;
   parameter WAIT_NORMAL = 3'b101;
   
   logic [2:0] state;
   
   
   always_ff @(posedge clk) begin
      case(state)
          RESET: begin
             volume_out <= 'd0;
             state <= IDLE;
          end
          IDLE: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                if(!up) begin
                   state <= UP_INCREMENT;
                end else begin
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
                if(volume_out < 'd26) begin
                   volume_out <= volume_out + 1;
                end
                state <= WAIT_NORMAL;
             end
          end
          DOWN_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(volume_out > 'd0) begin
                   volume_out <= volume_out - 1;
                end
                state <= WAIT_NORMAL;
             end
          end
          WAIT_NORMAL: begin
             if(reset) begin
                state <= RESET;
             end else begin
                if(up & down) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule
