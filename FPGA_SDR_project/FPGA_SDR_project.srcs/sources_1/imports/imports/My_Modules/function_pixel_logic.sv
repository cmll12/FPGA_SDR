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

   //The pixel values for our function,
   //centerline, and triggerline
   logic [11:0]pixel_out_centerline;
   logic [11:0]pixel_out_triggerline;
   logic [11:0]pixel_out_function;
   
   //Raw signe values
   logic signed[23:0] raw_signal_height;
   logic signed[23:0] raw_trigger_height;
   //Scaled down to 12 bits
   logic signed[11:0] scaled_signal_height;
   logic signed[11:0] scaled_trigger_height;
   
   //Used for the special audio version
   logic signed[11:0] signed_signal;
   assign signed_signal = signal_in;
   logic signed[11:0] signed_height_adjust;
   assign signed_height_adjust = height_adjust;
   
   //parameters for possible offsets
   parameter OFFSET_25 = 'sd2048;
   parameter OFFSET_20 = 'sd1638;
   parameter OFFSET_15 = 'sd1228;
   parameter OFFSET_AUDIO = 'sd0;
   
   always_comb begin
      //If it is audio we want to use a different offset
      //and different variables.
      if(is_audio) begin
         //multiply to get the signal up.
         raw_signal_height = (signed_signal - OFFSET_AUDIO) * signed_height_adjust;
         //Divide to normalize the signal.
         scaled_signal_height = raw_signal_height >>> 11;
            
         //same process
         raw_trigger_height = (trigger_height - OFFSET_AUDIO) * signed_height_adjust;
         scaled_trigger_height = raw_trigger_height >>> 11;
      end else begin
         //same process as above but different offset and using
         //original signal and trigger in.
         raw_signal_height = (signal_in - OFFSET_25) * height_adjust;
         scaled_signal_height = raw_signal_height >>> 11;
            
         raw_trigger_height = (trigger_height - OFFSET_25) * height_adjust;
         scaled_trigger_height = raw_trigger_height >>> 11;
      end
   end
   
   always_ff @(posedge vclock_in) begin
      //If the hcount is within a specific range, we might
      //have to display our function
      if((hcount_in>104) & (hcount_in<919)) begin
        //Using three pixel height, if our vcount matches the signal height we make
        //the function pixel white.
        if((vcount_in == (12'sd384 - scaled_signal_height)) 
           || (vcount_in == (12'sd384 - scaled_signal_height + 12'sd1)) 
           || (vcount_in == (12'sd384 - scaled_signal_height + 12'sd2))) begin
            pixel_out_function <= 12'hfff;
        end else begin
            pixel_out_function <= 12'h0;
        end
      end else begin
        pixel_out_function <= 12'h0;
      end
   end
   //Centerline is constant
   assign pixel_out_centerline = {12{((vcount_in==384) & (hcount_in>100) & (hcount_in<923))}};
   //Triggerline is like centerline but varies depending on the
   //actual trigger out
   assign pixel_out_triggerline = {4{((vcount_in==(12'sd384 - scaled_trigger_height)) & (hcount_in>100) & (hcount_in<923))}};
    
   //The pixel we send out is a combination of all of the pixel values.
   assign pixel_out = pixel_out_centerline + pixel_out_function + pixel_out_triggerline;  
endmodule
