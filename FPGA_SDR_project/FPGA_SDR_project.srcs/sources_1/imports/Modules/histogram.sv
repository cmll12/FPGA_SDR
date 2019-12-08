//`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mitchell Gu
// Project Name: Nexys4 FFT Demo
//////////////////////////////////////////////////////////////////////////////////

module histogram(
    input logic clk,
    input logic [10:0] hcount,
    input logic [9:0] vcount,
    input logic blank,
    input logic [1:0] range,
    output logic [9:0] vaddr,
    input logic [15:0] vdata,
    input logic [18:0] freq,
    output logic [12:0] pixel
    );

    // 1 bin per pixel, with the selected range
    assign vaddr = hcount[9:0] >> range;
    
    logic [9:0] hheight; // Height of histogram bar
    assign hheight = vdata >> 4;
    logic [9:0] vheight; // The height of pixel above bottom of screen
    assign vheight = 10'd500 - vcount;
    logic blank1; // blank pipelined 1
    
    logic[12:0] pixel_histogram;
    
    logic[12:0] pixel_marker;
    
    reg [18:0] current_freq = 18'd30_000;
    reg [9:0]  current_position = 10'd246;
    
    always_comb begin
      pixel_histogram = (vheight < hheight) ? 12'hfff : 12'b0;
      if(hcount == current_position || hcount == (current_position + 1) || hcount == (current_position - 1)) begin
         if((vcount < 'd520) && (vcount > 'd505)) begin
            pixel_marker = 12'hd22;
         end else begin
            pixel_marker = 0;
         end
      end else begin
         pixel_marker = 0;
      end
    end
    
    always @(posedge clk) begin
        pixel <= pixel_histogram + pixel_marker;
        
        if(((freq - current_freq) >= 'd122) && ((freq - current_freq) < 'd100_000)) begin
           current_position <= current_position + 1;
           current_freq = current_freq + 'd122;
        end else begin
           if(((current_freq - freq) >= 'd122)) begin
              current_position <= current_position - 1;
              current_freq = current_freq - 'd122;
           end
        end
    end

endmodule
