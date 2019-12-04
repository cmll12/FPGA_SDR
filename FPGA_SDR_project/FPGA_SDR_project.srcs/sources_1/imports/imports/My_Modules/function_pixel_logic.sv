module function_pixel_logic (
   input vclock_in,        // 65MHz clock
   input reset_in,         // 1 to initialize module
   input [10:0] hcount_in, // horizontal index of current pixel (0..1023)
   input [9:0]  vcount_in, // vertical index of current pixel (0..767)
   input [11:0] height_adjust,
   input [11:0] signal_in,
   input [11:0] trigger_height,   
   input is_audio,
   output [11:0] pixel_out  // pong game's pixel  // r=11:8, g=7:4, b=3:0
   );

   logic [11:0]pixel_out_centerline;
   logic [11:0]pixel_out_triggerline;
   logic [11:0]pixel_out_function;
   
   logic signed[23:0] raw_signal_height;
   logic signed[11:0] scaled_signal_height;
   
   logic signed[23:0] raw_trigger_height;
   logic signed[11:0] scaled_trigger_height;
   
   parameter OFFSET_25 = 'sd2048;
   parameter OFFSET_20 = 'sd1638;
   parameter OFFSET_15 = 'sd1228;
   
   parameter OFFSET_AUDIO = 'sd128;
   
   always_comb begin
      raw_signal_height = (signal_in - OFFSET_20) * height_adjust;
      scaled_signal_height = raw_signal_height >>> 11;
        
      raw_trigger_height = (trigger_height - OFFSET_20) * height_adjust;
      scaled_trigger_height = raw_trigger_height >>> 11;
   end
   
   always_ff @(posedge vclock_in) begin
      if((hcount_in>104) & (hcount_in<919)) begin
        if((vcount_in == (12'sd384 - scaled_signal_height)) || (vcount_in == (12'sd384 - scaled_signal_height + 12'sd1)) || (vcount_in == (12'sd384 - scaled_signal_height + 12'sd2))) begin
            pixel_out_function <= 12'hfff;
        end else begin
            pixel_out_function <= 12'h0;
        end
      end else begin
        pixel_out_function <= 12'h0;
      end
   end
   assign pixel_out_centerline = {12{((vcount_in==384) & (hcount_in>100) & (hcount_in<923))}};
   assign pixel_out_triggerline = {4{((vcount_in==(12'sd384 - scaled_trigger_height)) & (hcount_in>100) & (hcount_in<923))}};
    
   assign pixel_out = pixel_out_centerline + pixel_out_function + pixel_out_triggerline;  
endmodule
