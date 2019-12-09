`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2019 11:43:27 AM
// Design Name: 
// Module Name: control_zoom_magnitude
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control_zoom_magnitude(
   input clk,
   input up,
   input down,
   input reset,
   input is_fft,
   output logic [1:0] zoom_out
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
             zoom_out <= 'd0  ;
             state <= IDLE;
          end
          IDLE: begin
             if(reset) begin
                 state <= RESET;
             end else begin
                if(!up & is_fft) begin
                   state <= UP_INCREMENT;
                end else begin
                   if(!down & is_fft) begin
                      state <= DOWN_INCREMENT;
                  end
               end
             end
          end
          UP_INCREMENT: begin
             if(reset) begin
                state <= RESET;
             end else begin
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
                if(up & down & is_fft) begin
                   state <= IDLE;
                end
             end
          end
          default: state <= RESET;
      endcase
   end
endmodule

