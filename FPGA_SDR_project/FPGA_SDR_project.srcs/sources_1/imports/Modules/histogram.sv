//`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mitchell Gu
// Project Name: Nexys4 FFT Demo
//////////////////////////////////////////////////////////////////////////////////

module histogram(
    input logic clk,
    input logic rst,
    input logic [10:0] hcount,
    input logic [9:0] vcount,
    input logic blank,
    input logic [1:0] range_in,
    output logic [9:0] vaddr,
    input logic [15:0] vdata,
    input logic [18:0] freq,
    input logic is_if,
    input [9:0] zoom_offset_in,
    input is_waterfall,
    input vsync_pulse,
    output logic [12:0] pixel
    );
    
    //Range and zoom offset wires
    logic[1:0] range;
    logic[9:0] zoom_offset;
    
    // 1 bin per pixel, with the selected range
    assign vaddr = (hcount[9:0] >> range) + zoom_offset;
    
    logic [9:0] hheight; // Height of histogram bar
    assign hheight = vdata >> 4;
    logic [9:0] vheight; // The height of pixel above bottom of screen
    assign vheight = 10'd500 - vcount; 
    logic blank1; // blank pipelined 1
    
    //Pixel wires for different parts of the FFT display
    logic[12:0] pixel_histogram;
    logic[12:0] pixel_waterfall;
    logic[12:0] pixel_marker;
    
    //Set registers to default values for current frequency
    //and the current position of the center frequency
    //marker.
    reg [22:0] current_freq = 22'd600_000;
    reg [16:0]  current_position = 10'd246;
    
    //Wires for logic in the zooming.
    logic[21:0] max_frequency;
    logic[21:0] min_frequency_window;
    logic[21:0] max_frequency_window;
    logic[16:0] display_position;
    logic[11:0] spacer;
    logic[16:0] if_position;
    always_comb begin
       //The max frequency of a zoom is the original max
       //shifted by the range.
       max_frequency = 'd2500000 >> range;
       //The position of the center frequency marker will be shifted
       //by the zoom offset and than shifted to match the zoom
       display_position = ((current_position - zoom_offset) << range); 
       //The spacer is a constant value, it is the frequency difference
       //between pixels at no zoom
       spacer = 'd2500000 >> 10;
       //This is the line for the intermediate frequency. It is constant.
       if_position = ('d187 - zoom_offset) << range;
       //The minimum frequency for our window will by the zoom offset multiplied
       //by the spacer
       min_frequency_window = zoom_offset * spacer;
       //The max frequency of the window will the minimum freqency plus the max 
       //frequency of the zoom.
       max_frequency_window = min_frequency_window + max_frequency;
       
       //If we are trying to display the waterfall we want a certain zoom and
       //position, else we do waht the user has input. 
       if(is_waterfall) begin
          range <= 'd11;
          zoom_offset <= current_position - 'd60;
       end else begin
          range <= range_in;
          zoom_offset <= zoom_offset_in;
       end
    end
    
    always_comb begin
      //The pixel of the fft is based on the current vcount (vheight) and
      //the height of the hisogram.
      pixel_histogram = (vheight < hheight) ? 12'hfff : 12'b0;
      
      //We should display the frequency center market if we are around the
      //correct horizontal area corresponding to that frequency. We also have to
      //make sure the freqency is in range, as the display_position can overflow
      if((hcount == display_position || hcount == (display_position + 1) || hcount == (display_position - 1))
          && (current_freq < max_frequency_window) && (current_freq > min_frequency_window)) begin
         //Sets the height of the market.
         if((vcount < 'd520) && (vcount > 'd505)) begin
            pixel_marker = 12'hd22;
         end else begin
            pixel_marker = 0;
         end
      end else begin
         //Same for the centerfrequency marker but for the IF frequency.
         //The color for this marker in mint.
         if(is_if) begin
            if((hcount == if_position || hcount == (if_position + 1) || hcount == (if_position - 1))
               && ('d455_000 < max_frequency_window) && ('d455_000 > min_frequency_window)) begin
               if((vcount < 'd520) && (vcount > 'd505)) begin
                  pixel_marker = 12'h0fb;
               end else begin
                  pixel_marker = 0;
               end
            end else begin
               pixel_marker = 0;
            end
         end else begin
            pixel_marker = 0;
         end
      end
    end
    
    //State machine for the waterfall displays.
    //The waterfall display currently does not
    //work as expected.
    parameter RESET = 2'b00;
    parameter ADDING = 2'b01;
    parameter TRANSITION = 2'b11;
    logic [1:0]state;
    
    //The concept for the waterfall is that it would be 8 sections
    //lengthwise and 7 seconts heightwise. Here we have a value
    //for each of those.
    logic[9:0] bin1_section1;
    logic[9:0] bin2_section1;
    logic[9:0] bin3_section1;
    logic[9:0] bin4_section1;
    logic[9:0] bin5_section1;
    logic[9:0] bin6_section1;
    logic[9:0] bin7_section1;
    logic[9:0] bin8_section1;
    
    logic[9:0] bin1_section2;
    logic[9:0] bin2_section2;
    logic[9:0] bin3_section2;
    logic[9:0] bin4_section2;
    logic[9:0] bin5_section2;
    logic[9:0] bin6_section2;
    logic[9:0] bin7_section2;
    logic[9:0] bin8_section2;
    
    logic[9:0] bin1_section3;
    logic[9:0] bin2_section3;
    logic[9:0] bin3_section3;
    logic[9:0] bin4_section3;
    logic[9:0] bin5_section3;
    logic[9:0] bin6_section3;
    logic[9:0] bin7_section3;
    logic[9:0] bin8_section3;
    
    logic[9:0] bin1_section4;
    logic[9:0] bin2_section4;
    logic[9:0] bin3_section4;
    logic[9:0] bin4_section4;
    logic[9:0] bin5_section4;
    logic[9:0] bin6_section4;
    logic[9:0] bin7_section4;
    logic[9:0] bin8_section4;
    
    logic[9:0] bin1_section5;
    logic[9:0] bin2_section5;
    logic[9:0] bin3_section5;
    logic[9:0] bin4_section5;
    logic[9:0] bin5_section5;
    logic[9:0] bin6_section5;
    logic[9:0] bin7_section5;
    logic[9:0] bin8_section5;
    
    logic[9:0] bin1_section6;
    logic[9:0] bin2_section6;
    logic[9:0] bin3_section6;
    logic[9:0] bin4_section6;
    logic[9:0] bin5_section6;
    logic[9:0] bin6_section6;
    logic[9:0] bin7_section6;
    logic[9:0] bin8_section6;
    
    logic[9:0] bin1_section7;
    logic[9:0] bin2_section7;
    logic[9:0] bin3_section7;
    logic[9:0] bin4_section7;
    logic[9:0] bin5_section7;
    logic[9:0] bin6_section7;
    logic[9:0] bin7_section7;
    logic[9:0] bin8_section7;
    
    //We had accumulators that take the average of the
    //areas, which we will divide to get the average
    //value
    logic[21:0] bin1_accumulator;
    logic[21:0] bin2_accumulator;
    logic[21:0] bin3_accumulator;
    logic[21:0] bin4_accumulator;
    logic[21:0] bin5_accumulator;
    logic[21:0] bin6_accumulator;
    logic[21:0] bin7_accumulator;
    logic[21:0] bin8_accumulator;
    
    logic[5:0] counter;
    always @(posedge clk) begin
       //Only do this if waterfall is active
       if(is_waterfall) begin
          case(state)
             RESET: begin
                //Reset everything
                bin1_section1 <= 0;
                bin2_section1 <= 0;
                bin3_section1 <= 0;
                bin4_section1 <= 0;
                bin5_section1 <= 0;
                bin6_section1 <= 0;
                bin7_section1 <= 0;
                bin8_section1 <= 0;
                
                bin1_section2 <= 0;
                bin2_section2 <= 0;
                bin3_section2 <= 0;
                bin4_section2 <= 0;
                bin5_section2 <= 0;
                bin6_section2 <= 0;
                bin7_section2 <= 0;
                bin8_section2 <= 0;
                
                bin1_section3 <= 0;
                bin2_section3 <= 0;
                bin3_section3 <= 0;
                bin4_section3 <= 0;
                bin5_section3 <= 0;
                bin6_section3 <= 0;
                bin7_section3 <= 0;
                bin8_section3 <= 0;
                
                bin1_section4 <= 0;
                bin2_section4 <= 0;
                bin3_section4 <= 0;
                bin4_section4 <= 0;
                bin5_section4 <= 0;
                bin6_section4 <= 0;
                bin7_section4 <= 0;
                bin8_section4 <= 0;
                
                bin1_section5 <= 0;
                bin2_section5 <= 0;
                bin3_section5 <= 0;
                bin4_section5 <= 0;
                bin5_section5 <= 0;
                bin6_section5 <= 0;
                bin7_section5 <= 0;
                bin8_section5 <= 0;
                
                bin1_section6 <= 0;
                bin2_section6 <= 0;
                bin3_section6 <= 0;
                bin4_section6 <= 0;
                bin5_section6 <= 0;
                bin6_section6 <= 0;
                bin7_section6 <= 0;
                bin8_section6 <= 0;
                
                bin1_section7 <= 0;
                bin2_section7 <= 0;
                bin3_section7 <= 0;
                bin4_section7 <= 0;
                bin5_section7 <= 0;
                bin6_section7 <= 0;
                bin7_section7 <= 0;
                bin8_section7 <= 0;
                
                bin1_accumulator <= 0;
                bin2_accumulator <= 0;
                bin3_accumulator <= 0;
                bin4_accumulator <= 0;
                bin5_accumulator <= 0;
                bin6_accumulator <= 0;
                bin7_accumulator <= 0;
                bin8_accumulator <= 0;
                
                counter <= 0;
                
                state <= ADDING;
             end
             ADDING: begin
                   //For one line we add up all the hheights of a certain area.
                   //This total will be divided to get the average.
                   if(vcount == 'd521) begin
                      if((hcount >= 0) && (hcount <= 'd127)) begin
                         bin1_accumulator <= bin1_accumulator + hheight;
                      end else if ((hcount >= 'd128) && (hcount <= 'd255)) begin
                         bin2_accumulator <= bin2_accumulator + hheight;
                      end else if ((hcount >= 'd256) && (hcount <= 'd383)) begin
                         bin3_accumulator <= bin3_accumulator + hheight;
                      end else if ((hcount >= 'd384) && (hcount <= 'd511)) begin
                         bin4_accumulator <= bin4_accumulator + hheight;
                      end else if ((hcount >= 'd512) && (hcount <= 'd639)) begin
                         bin5_accumulator <= bin5_accumulator + hheight;
                      end else if ((hcount >= 'd640) && (hcount <= 'd767)) begin
                         bin6_accumulator <= bin6_accumulator + hheight;
                      end else if ((hcount >= 'd768) && (hcount <= 'd895)) begin
                         bin7_accumulator <= bin7_accumulator + hheight;
                      end else if ((hcount >= 'd896) && (hcount <= 'd1023)) begin
                         bin8_accumulator <= bin8_accumulator + hheight;
                      end
                end
                //On next like we transistion
                if(vcount == 'd522) begin
                   state <= TRANSITION;
                end
             end
             TRANSITION: begin
                //For transition the most recent section is the division
                //of the accumulator and the rest are cascaded down.
                bin1_section1 <= bin1_accumulator >> 7;
                bin2_section1 <= bin2_accumulator >> 7;
                bin3_section1 <= bin3_accumulator >> 7;
                bin4_section1 <= bin4_accumulator >> 7;
                bin5_section1 <= bin5_accumulator >> 7;
                bin6_section1 <= bin6_accumulator >> 7;
                bin7_section1 <= bin7_accumulator >> 7;
                bin8_section1 <= bin8_accumulator >> 7;
                 
                bin1_section2 <= bin1_section1;
                bin2_section2 <= bin2_section1;
                bin3_section2 <= bin3_section1;
                bin4_section2 <= bin4_section1;
                bin5_section2 <= bin5_section1;
                bin6_section2 <= bin6_section1;
                bin7_section2 <= bin7_section1;
                bin8_section2 <= bin8_section1;
                
                bin1_section3 <= bin1_section2;
                bin2_section3 <= bin2_section2;
                bin3_section3 <= bin3_section2;
                bin4_section3 <= bin4_section2;
                bin5_section3 <= bin5_section2;
                bin6_section3 <= bin6_section2;
                bin7_section3 <= bin7_section2;
                bin8_section3 <= bin8_section2;
                
                bin1_section4 <= bin1_section3;
                bin2_section4 <= bin2_section3;
                bin3_section4 <= bin3_section3;
                bin4_section4 <= bin4_section3;
                bin5_section4 <= bin5_section3;
                bin6_section4 <= bin6_section3;
                bin7_section4 <= bin7_section3;
                bin8_section4 <= bin8_section3;
                
                bin1_section5 <= bin1_section4;
                bin2_section5 <= bin2_section4;
                bin3_section5 <= bin3_section4;
                bin4_section5 <= bin4_section4;
                bin5_section5 <= bin5_section4;
                bin6_section5 <= bin6_section4;
                bin7_section5 <= bin7_section4;
                bin8_section5 <= bin8_section4;
                
                bin1_section6 <= bin1_section5;
                bin2_section6 <= bin2_section5;
                bin3_section6 <= bin3_section5;
                bin4_section6 <= bin4_section5;
                bin5_section6 <= bin5_section5;
                bin6_section6 <= bin6_section5;
                bin7_section6 <= bin7_section5;
                bin8_section6 <= bin8_section5;
                
                bin1_section7 <= bin1_section6;
                bin2_section7 <= bin2_section6;
                bin3_section7 <= bin3_section6;
                bin4_section7 <= bin4_section6;
                bin5_section7 <= bin5_section6;
                bin6_section7 <= bin6_section6;
                bin7_section7 <= bin7_section6;
                bin8_section7 <= bin8_section6;
                
                bin1_accumulator <= 0;
                bin2_accumulator <= 0;
                bin3_accumulator <= 0;
                bin4_accumulator <= 0;
                bin5_accumulator <= 0;
                bin6_accumulator <= 0;
                bin7_accumulator <= 0;
                bin8_accumulator <= 0;
                 
                counter <= 0;
                state <= ADDING;
             end
             default: state <= RESET;
          endcase
          //For display, we have to determine what area the waterfall is in and
          //have the correct bin and section determine the pixel color. In this
          //scheme red colors are supposed to be high magnitude while blue colors
          //are low magnitude.
          if((vcount >= 'd530) && (vcount <= 'd549)) begin
             if((hcount >= 0) && (hcount <= 'd127)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[6:2]}};
             end else if ((hcount >= 'd128) && (hcount <= 'd255)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[6:2]}};
             end else if ((hcount >= 'd256) && (hcount <= 'd383)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[6:2]}};
             end else if ((hcount >= 'd384) && (hcount <= 'd511)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[5:1]}};
             end else if ((hcount >= 'd512) && (hcount <= 'd639)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[6:2]}};
             end else if ((hcount >= 'd640) && (hcount <= 'd767)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[6:2]}};
             end else if ((hcount >= 'd768) && (hcount <= 'd895)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[6:2]}};
             end else if ((hcount >= 'd896) && (hcount <= 'd1023)) begin
                pixel_waterfall <= {{hheight[6:2]}, {4'd0}, {4'hF - hheight[6:2]}};
             end
          end else if((vcount >= 'd550) && (vcount <= 'd569)) begin
             if((hcount >= 0) && (hcount <= 'd127)) begin
                pixel_waterfall <= {{bin1_section2[6:2]}, {4'd0}, {4'hF - bin1_section2[6:2]}};
             end else if ((hcount >= 'd128) && (hcount <= 'd255)) begin
                pixel_waterfall <= {{bin2_section2[6:2]}, {4'd0}, {4'hF - bin2_section2[6:2]}};
             end else if ((hcount >= 'd256) && (hcount <= 'd383)) begin
                pixel_waterfall <= {{bin3_section2[6:2]}, {4'd0}, {4'hF - bin3_section2[6:2]}};
             end else if ((hcount >= 'd384) && (hcount <= 'd511)) begin
                pixel_waterfall <= {{bin4_section2[6:2]}, {4'd0}, {4'hF - bin4_section2[6:2]}};
             end else if ((hcount >= 'd512) && (hcount <= 'd639)) begin
                pixel_waterfall <= {{bin5_section2[6:2]}, {4'd0}, {4'hF - bin5_section2[6:2]}};
             end else if ((hcount >= 'd640) && (hcount <= 'd767)) begin
                pixel_waterfall <= {{bin6_section2[6:2]}, {4'd0}, {4'hF - bin6_section2[6:2]}};
             end else if ((hcount >= 'd768) && (hcount <= 'd895)) begin
                pixel_waterfall <= {{bin7_section2[6:2]}, {4'd0}, {4'hF - bin7_section2[6:2]}};
             end else if ((hcount >= 'd896) && (hcount <= 'd1023)) begin
                pixel_waterfall <= {{bin8_section2[6:2]}, {4'd0}, {4'hF - bin8_section2[6:2]}};
             end
          end else if((vcount >= 'd570) && (vcount <= 'd589)) begin
             if((hcount >= 0) && (hcount <= 'd127)) begin
                pixel_waterfall <= {{bin1_section3[6:2]}, {4'd0}, {4'hF - bin1_section3[6:2]}};
             end else if ((hcount >= 'd128) && (hcount <= 'd255)) begin
                pixel_waterfall <= {{bin2_section3[6:2]}, {4'd0}, {4'hF - bin2_section3[6:2]}};
             end else if ((hcount >= 'd256) && (hcount <= 'd383)) begin
                pixel_waterfall <= {{bin3_section3[6:2]}, {4'd0}, {4'hF - bin3_section3[6:2]}};
             end else if ((hcount >= 'd384) && (hcount <= 'd511)) begin
                pixel_waterfall <= {{bin4_section3[6:2]}, {4'd0}, {4'hF - bin4_section3[6:2]}};
             end else if ((hcount >= 'd512) && (hcount <= 'd639)) begin
                pixel_waterfall <= {{bin5_section3[6:2]}, {4'd0}, {4'hF - bin5_section3[6:2]}};
             end else if ((hcount >= 'd640) && (hcount <= 'd767)) begin
                pixel_waterfall <= {{bin6_section3[6:2]}, {4'd0}, {4'hF - bin6_section3[6:2]}};
             end else if ((hcount >= 'd768) && (hcount <= 'd895)) begin
                pixel_waterfall <= {{bin7_section3[6:2]}, {4'd0}, {4'hF - bin7_section3[6:2]}};
             end else if ((hcount >= 'd896) && (hcount <= 'd1023)) begin
                pixel_waterfall <= {{bin8_section3[6:2]}, {4'd0}, {4'hF - bin8_section3[6:2]}};
             end
          end else if((vcount >= 'd590) && (vcount <= 'd609)) begin
             if((hcount >= 0) && (hcount <= 'd127)) begin
                pixel_waterfall <= {{bin1_section4[6:2]}, {4'd0}, {4'hF - bin1_section4[6:2]}};
             end else if ((hcount >= 'd128) && (hcount <= 'd255)) begin
                pixel_waterfall <= {{bin2_section4[6:2]}, {4'd0}, {4'hF - bin2_section4[6:2]}};
             end else if ((hcount >= 'd256) && (hcount <= 'd383)) begin
                pixel_waterfall <= {{bin3_section4[6:2]}, {4'd0}, {4'hF - bin3_section4[6:2]}};
             end else if ((hcount >= 'd384) && (hcount <= 'd511)) begin
                pixel_waterfall <= {{bin4_section4[6:2]}, {4'd0}, {4'hF - bin4_section4[6:2]}};
             end else if ((hcount >= 'd512) && (hcount <= 'd639)) begin
                pixel_waterfall <= {{bin5_section4[6:2]}, {4'd0}, {4'hF - bin5_section4[6:2]}};
             end else if ((hcount >= 'd640) && (hcount <= 'd767)) begin
                pixel_waterfall <= {{bin6_section4[6:2]}, {4'd0}, {4'hF - bin6_section4[6:2]}};
             end else if ((hcount >= 'd768) && (hcount <= 'd895)) begin
                pixel_waterfall <= {{bin7_section4[6:2]}, {4'd0}, {4'hF - bin7_section4[6:2]}};
             end else if ((hcount >= 'd896) && (hcount <= 'd1023)) begin
                pixel_waterfall <= {{bin8_section4[6:2]}, {4'd0}, {4'hF - bin8_section4[6:2]}};
             end
          end else if((vcount >= 'd610) && (vcount <= 'd629)) begin
             if((hcount >= 0) && (hcount <= 'd127)) begin
                pixel_waterfall <= {{bin1_section5[6:2]}, {4'd0}, {4'hF - bin1_section5[6:2]}};
             end else if ((hcount >= 'd128) && (hcount <= 'd255)) begin
                pixel_waterfall <= {{bin2_section5[6:2]}, {4'd0}, {4'hF - bin2_section5[6:2]}};
             end else if ((hcount >= 'd256) && (hcount <= 'd383)) begin
                pixel_waterfall <= {{bin3_section5[6:2]}, {4'd0}, {4'hF - bin3_section5[6:2]}};
             end else if ((hcount >= 'd384) && (hcount <= 'd511)) begin
                pixel_waterfall <= {{bin4_section5[6:2]}, {4'd0}, {4'hF - bin4_section5[6:2]}};
             end else if ((hcount >= 'd512) && (hcount <= 'd639)) begin
                pixel_waterfall <= {{bin5_section5[6:2]}, {4'd0}, {4'hF - bin5_section5[6:2]}};
             end else if ((hcount >= 'd640) && (hcount <= 'd767)) begin
                pixel_waterfall <= {{bin6_section5[6:2]}, {4'd0}, {4'hF - bin6_section5[6:2]}};
             end else if ((hcount >= 'd768) && (hcount <= 'd895)) begin
                pixel_waterfall <= {{bin7_section5[6:2]}, {4'd0}, {4'hF - bin7_section5[6:2]}};
             end else if ((hcount >= 'd896) && (hcount <= 'd1023)) begin
                pixel_waterfall <= {{bin8_section5[6:2]}, {4'd0}, {4'hF - bin8_section5[6:2]}};
             end
          end else begin
             pixel_waterfall <= 0;
          end
       end else begin
          pixel_waterfall <= 0;
       end
    end
    
    always @(posedge clk) begin
        //The pixel we send out is the combination of all the pixels 
        //we are written so far.
        pixel <= pixel_histogram + pixel_marker + pixel_waterfall;
        //If we are reset we set the frequency back to its original
        //spot
        if(rst) begin
           current_freq <= 22'd600_000;
           current_position <= 10'd246;
        //Else we check if the frequency is out of range. We make sure it isn't too far
        //off, as if you subtract this way a shift in the opposite direction would overflow.
        end else if(((20*freq - current_freq) >= spacer) && ((20*freq - current_freq) < 'd100_000)) begin
           //Update the position and the current frequency for a signle position. If
           //multiple steps are needed it will take multiple clock cycles.
           current_position <= current_position + 1;
           current_freq = current_freq + spacer;
        end else begin
           //Same as above for the opposite direction.
           if(((current_freq - 20*freq) >= spacer) && ((current_freq - 20*freq) < 'd100_000)) begin
              current_position <= current_position - 1;
              current_freq = current_freq - spacer;
           end
        end
    end

endmodule
