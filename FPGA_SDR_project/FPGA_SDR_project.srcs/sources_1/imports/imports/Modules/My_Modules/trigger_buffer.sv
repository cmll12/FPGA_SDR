module trigger_buffer (
   input clock_in,
   input reset_in,
   input [11:0] signal_in,
   input [11:0] trigger_height,
   input [10:0] hcount_in,
   input [9:0]  vcount_in,  
   input [11:0] period,   
   output logic [11:0] signal_out
   );
   
   parameter RESET = 5'b00000;
   parameter BRAM1_WAIT_FOR_TRIGGER = 5'b00001;
   parameter BRAM1_VERIFY_TRIGGER = 5'b00011;
   parameter BRAM1_WAIT_FOR_FILL = 5'b00111;
   parameter BRAM1_WAIT_FOR_FRAME = 5'b01111;
   parameter BRAM2_WAIT_FOR_TRIGGER = 5'b11111;
   parameter BRAM2_VERIFY_TRIGGER = 5'b11101;
   parameter BRAM2_WAIT_FOR_FILL = 5'b11001;
   parameter BRAM2_WAIT_FOR_FRAME = 5'b10001;
   logic [4:0] state;
   
   logic [9:0] frame1_addr;
   logic [11:0] data_to_frame1;
   logic [11:0] data_from_frame1;
   logic write_frame1;
   
   frame_bram frame1(.addra(frame1_addr), .clka(clock_in), 
      .dina(data_to_frame1), .douta(data_from_frame1), .ena(1), 
      .wea(write_frame1));
      
   logic [9:0] frame2_addr;
   logic [11:0] data_to_frame2;
   logic [11:0] data_from_frame2;
   logic write_frame2;
   
   frame_bram frame2(.addra(frame2_addr), .clka(clock_in), 
      .dina(data_to_frame2), .douta(data_from_frame2), .ena(1), 
      .wea(write_frame2));
   
   logic [11:0] signal_height;
   
   logic [11:0] past_signal;
   logic [11:0] past_signal2;
   logic [11:0] past_signal3;
   logic [11:0] past_signal4;
   logic [11:0] past_signal5;
   logic [11:0] past_signal6;
   logic [11:0] past_signal7;
   logic [11:0] past_signal8;
   logic [11:0] past_signal9;
   logic [11:0] past_signal10;
   logic [11:0] past_signal11;
   logic [11:0] past_signal12;
   logic [11:0] past_signal13;
   logic [11:0] past_signal14;
   logic [11:0] past_signal15;
   logic [11:0] past_signal16;
   logic [11:0] past_signal17;
   logic [11:0] past_signal18;
   logic [11:0] past_signal19;
   
   logic [11:0] counter;
   
   logic [11:0] trigger_counter;
   parameter NEEDED_HIGH = 'd3;
   
   always_ff @(posedge clock_in) begin
      case(state)
         RESET: begin
            frame1_addr <= 0;
            frame2_addr <= 0;
            write_frame1 <= 0;
            write_frame2 <= 0;
            data_to_frame1 <= 0;
            data_to_frame2 <= 0;
            counter <= 0;
            signal_out <= 0;
            past_signal19 <= trigger_height;
            past_signal18 <= trigger_height;
            past_signal17 <= trigger_height;
            past_signal16 <= trigger_height;
            past_signal15 <= trigger_height;
            past_signal14 <= trigger_height;
            past_signal13 <= trigger_height;
            past_signal12 <= trigger_height;
            past_signal11 <= trigger_height;
            past_signal10 <= trigger_height;
            past_signal9 <= trigger_height;
            past_signal8 <= trigger_height;
            past_signal7 <= trigger_height;
            past_signal6 <= trigger_height;
            past_signal5 <= trigger_height;
            past_signal4 <= trigger_height;
            past_signal3 <= trigger_height;
            past_signal2 <= trigger_height;
            past_signal <= trigger_height;
            if (!reset_in) begin
               state <= BRAM1_WAIT_FOR_TRIGGER;
            end
         end
         BRAM1_WAIT_FOR_TRIGGER: begin
            frame2_addr <= (hcount_in - 'd101);
            signal_out <= data_from_frame2;
            past_signal19 <= past_signal18;
            past_signal18 <= past_signal17;
            past_signal17 <= past_signal16;
            past_signal16 <= past_signal15;
            past_signal15 <= past_signal14;
            past_signal14 <= past_signal13;
            past_signal13 <= past_signal12;
            past_signal12 <= past_signal11;
            past_signal11 <= past_signal10;
            past_signal10 <= past_signal9;
            past_signal9 <= past_signal8;
            past_signal8 <= past_signal7;
            past_signal7 <= past_signal6;
            past_signal6 <= past_signal5;
            past_signal5 <= past_signal4;
            past_signal4 <= past_signal3;
            past_signal3 <= past_signal2;
            past_signal2 <= past_signal;
            past_signal <= signal_in;
            trigger_counter <= 0;
            if((past_signal < trigger_height) && 
               (past_signal2 < trigger_height) && 
               (past_signal3 < trigger_height) &&
               (past_signal4 < trigger_height) &&
               (past_signal5 < trigger_height) &&
               (past_signal6 < trigger_height) && 
               (past_signal7 < trigger_height) && 
               (past_signal8 < trigger_height) && 
               (past_signal9 < trigger_height) &&
               (past_signal10 < trigger_height) && 
               (past_signal11 < trigger_height) && 
               (past_signal12 < trigger_height) &&
               (past_signal13 < trigger_height) && 
               (past_signal14 < trigger_height) && 
               (past_signal15 < trigger_height) && 
               (past_signal16 < trigger_height) && 
               (past_signal17 < trigger_height) && 
               (past_signal18 < trigger_height) && 
               (past_signal19 < trigger_height) &&
               ((signal_in - past_signal) < 'd1000) &&    
               (signal_in >= trigger_height)) begin
                frame1_addr <= 0;
                write_frame1 <= 1;
                data_to_frame1 <= signal_in;
                state <= BRAM1_VERIFY_TRIGGER;
                counter <= 0;
                trigger_counter <= 0;
            end
         end
         BRAM1_VERIFY_TRIGGER: begin
            if(signal_in < trigger_height) begin
               state <= BRAM1_WAIT_FOR_TRIGGER;
               counter <= 0;
               trigger_counter <= 0;
               frame2_addr <= (hcount_in - 'd101);
               signal_out <= data_from_frame2;
               frame1_addr <= 0;
               write_frame1 <= 0;
               write_frame2 <= 0;
               data_to_frame1 <= 0;
               data_to_frame2 <= 0;
               past_signal19 <= trigger_height;
               past_signal18 <= trigger_height;
               past_signal17 <= trigger_height;
               past_signal16 <= trigger_height;
               past_signal15 <= trigger_height;
               past_signal14 <= trigger_height;
               past_signal13 <= trigger_height;
               past_signal12 <= trigger_height;
               past_signal11 <= trigger_height;
               past_signal10 <= trigger_height;
               past_signal9 <= trigger_height;
               past_signal8 <= trigger_height;
               past_signal7 <= trigger_height;
               past_signal6 <= trigger_height;
               past_signal5 <= trigger_height;
               past_signal4 <= trigger_height;
               past_signal3 <= trigger_height;
               past_signal2 <= trigger_height;
               past_signal <= trigger_height;
            end else begin
               frame2_addr <= (hcount_in - 'd101);
               signal_out <= data_from_frame2;
               data_to_frame1 <= signal_in;
               if(trigger_counter >= NEEDED_HIGH) begin
                  state<= BRAM1_WAIT_FOR_FILL;
               end else begin
                  trigger_counter <= trigger_counter + 1;
               end
               if(counter == period) begin
                  frame1_addr <= frame1_addr + 1;
                  counter <= 0;
               end else begin
                  counter <= counter + 1;
               end
            end
         end
         BRAM1_WAIT_FOR_FILL: begin
            frame2_addr <= (hcount_in - 'd101);
            signal_out <= data_from_frame2;
            data_to_frame1 <= signal_in;
            if(frame1_addr == 'd821) begin
               state<= BRAM1_WAIT_FOR_FRAME;
               write_frame1 <= 0;
            end else begin
               if(counter == period) begin
                  frame1_addr <= frame1_addr + 1;
                  counter <= 0;
               end else begin
                  counter <= counter + 1;
               end
            end
         end
         BRAM1_WAIT_FOR_FRAME: begin
            frame2_addr <= (hcount_in - 'd101);
            signal_out <= data_from_frame2;
            if((vcount_in == 'd767)) begin
               state<= BRAM2_WAIT_FOR_TRIGGER;
            end
         end
         BRAM2_WAIT_FOR_TRIGGER: begin
            frame1_addr <= (hcount_in - 'd101);
            signal_out <= data_from_frame1;
            past_signal19 <= past_signal18;
            past_signal18 <= past_signal17;
            past_signal17 <= past_signal16;
            past_signal16 <= past_signal15;
            past_signal15 <= past_signal14;
            past_signal14 <= past_signal13;
            past_signal13 <= past_signal12;
            past_signal12 <= past_signal11;
            past_signal11 <= past_signal10;
            past_signal10 <= past_signal9;
            past_signal9 <= past_signal8;
            past_signal8 <= past_signal7;
            past_signal7 <= past_signal6;
            past_signal6 <= past_signal5;
            past_signal5 <= past_signal4;
            past_signal4 <= past_signal3;
            past_signal3 <= past_signal2;
            past_signal2 <= past_signal;
            past_signal <= signal_in;
            if((past_signal < trigger_height) && 
               (past_signal2 < trigger_height) && 
               (past_signal3 < trigger_height) &&
               (past_signal4 < trigger_height) &&
               (past_signal5 < trigger_height) &&
               (past_signal6 < trigger_height) && 
               (past_signal7 < trigger_height) && 
               (past_signal8 < trigger_height) && 
               (past_signal9 < trigger_height) &&
               (past_signal10 < trigger_height) && 
               (past_signal11 < trigger_height) && 
               (past_signal12 < trigger_height) &&
               (past_signal13 < trigger_height) && 
               (past_signal14 < trigger_height) && 
               (past_signal15 < trigger_height) && 
               (past_signal16 < trigger_height) && 
               (past_signal17 < trigger_height) && 
               (past_signal18 < trigger_height) && 
               (past_signal19 < trigger_height) &&   
               ((signal_in - past_signal) < 'd1000) &&     
               (signal_in >= trigger_height)) begin
                frame2_addr <= 0;
                write_frame2 <= 1;
                data_to_frame2 <= signal_in;
                state <= BRAM2_VERIFY_TRIGGER;
                counter <= 0;
            end
         end
         BRAM2_VERIFY_TRIGGER: begin
            if(signal_in < trigger_height) begin
               state <= BRAM2_WAIT_FOR_TRIGGER;
               counter <= 0;
               trigger_counter <= 0;
               frame1_addr <= (hcount_in - 'd101);
               signal_out <= data_from_frame2;
               frame2_addr <= 0;
               write_frame1 <= 0;
               write_frame2 <= 0;
               data_to_frame1 <= 0;
               data_to_frame2 <= 0;
               past_signal19 <= trigger_height;
               past_signal18 <= trigger_height;
               past_signal17 <= trigger_height;
               past_signal16 <= trigger_height;
               past_signal15 <= trigger_height;
               past_signal14 <= trigger_height;
               past_signal13 <= trigger_height;
               past_signal12 <= trigger_height;
               past_signal11 <= trigger_height;
               past_signal10 <= trigger_height;
               past_signal9 <= trigger_height;
               past_signal8 <= trigger_height;
               past_signal7 <= trigger_height;
               past_signal6 <= trigger_height;
               past_signal5 <= trigger_height;
               past_signal4 <= trigger_height;
               past_signal3 <= trigger_height;
               past_signal2 <= trigger_height;
               past_signal <= trigger_height;
            end else begin
               frame1_addr <= (hcount_in - 'd101);
               signal_out <= data_from_frame1;
               data_to_frame2 <= signal_in;
               if(trigger_counter >= NEEDED_HIGH) begin
                  state<= BRAM2_WAIT_FOR_FILL;
               end else begin
                  trigger_counter <= trigger_counter + 1;
               end
               if(counter == period) begin
                  frame2_addr <= frame2_addr + 1;
                  counter <= 0;
               end else begin
                  counter <= counter + 1;
               end
            end
         end
         BRAM2_WAIT_FOR_FILL: begin
            frame1_addr <= (hcount_in - 'd101);
            signal_out <= data_from_frame1;
            data_to_frame2 <= signal_in;
            if(frame2_addr == 'd821) begin
               state<= BRAM2_WAIT_FOR_FRAME;
               write_frame2 <= 0;
            end else begin
               if(counter == period) begin
                  frame2_addr <= frame2_addr + 1;
                  counter <= 0;
               end else begin
                  counter <= counter + 1;
               end
            end
         end
         BRAM2_WAIT_FOR_FRAME: begin
            frame1_addr <= (hcount_in - 'd100);
            signal_out <= data_from_frame1;
            if((vcount_in == 'd767)) begin
               state<= BRAM1_WAIT_FOR_TRIGGER;
            end
         end
         default: state <= RESET;
      endcase 
   end
endmodule
