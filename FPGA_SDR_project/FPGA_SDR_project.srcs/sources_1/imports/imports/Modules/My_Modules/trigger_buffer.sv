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
   
   //States for our state machine
   parameter RESET = 5'b00000;
   parameter BRAM1_WAIT_FOR_TRIGGER = 5'b00001;
   parameter BRAM1_VERIFY_TRIGGER = 5'b00011;
   parameter BRAM1_WAIT_FOR_FILL = 5'b00111;
   parameter BRAM1_WAIT_FOR_FRAME = 5'b01111;
   parameter BRAM2_WAIT_FOR_TRIGGER = 5'b11111;
   parameter BRAM2_VERIFY_TRIGGER = 5'b11101;
   parameter BRAM2_WAIT_FOR_FILL = 5'b11001;
   parameter BRAM2_WAIT_FOR_FRAME = 5'b10001;
   
   //state variable
   logic [4:0] state;
   
   //Important wires for interfacing with our first bram
   logic [9:0] frame1_addr;
   logic [11:0] data_to_frame1;
   logic [11:0] data_from_frame1;
   logic write_frame1;
   
   //Creating the first bram with the correct wires.
   frame_bram frame1(.addra(frame1_addr), .clka(clock_in), 
      .dina(data_to_frame1), .douta(data_from_frame1), .ena(1), 
      .wea(write_frame1));
      
   //Important wires for interfacing with our second bram
   logic [9:0] frame2_addr;
   logic [11:0] data_to_frame2;
   logic [11:0] data_from_frame2;
   logic write_frame2;
   
   //Creating the second bram with the correct wires.
   frame_bram frame2(.addra(frame2_addr), .clka(clock_in), 
      .dina(data_to_frame2), .douta(data_from_frame2), .ena(1), 
      .wea(write_frame2));
   
   //Registers for out past values. Used for triggering.
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
   
   //Counter to make sure we don't store too much data.
   logic [11:0] counter;
   
   //Counter to make sure we stay high for a certain
   //amount of time.
   logic [11:0] trigger_counter;
   
   //Parameter to set how long you have to stay above trigger.
   parameter NEEDED_HIGH = 'd3;
   
   always_ff @(posedge clock_in) begin
      case(state)
         RESET: begin
            //Reset all variables
            frame1_addr <= 0;
            frame2_addr <= 0;
            write_frame1 <= 0;
            write_frame2 <= 0;
            data_to_frame1 <= 0;
            data_to_frame2 <= 0;
            counter <= 0;
            signal_out <= 0;
            //Past values reset to trigger so that
            //they don't do a false positive.
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
         //In this state we wait until the signal
         //goes above trigger
         BRAM1_WAIT_FOR_TRIGGER: begin
            //We set the signal out based on the output from
            //bram 2. That is because bram 2 current holds the
            //captured signal from the last run and we want to
            //keep displaying that until we get a new sample.
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
            //All the past signals need to be below
            //trigger while our current value needs
            //to be at or above trigger level. There
            //is an aditional requirement that the jump
            //above the trigger cannot be too high of a gap.
            //That makes it so that noise cannot set off the
            //trigger.
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
                //Set the address to 0 for capturing
                frame1_addr <= 0;
                //Set the write high
                write_frame1 <= 1;
                //Set the correct data in.
                data_to_frame1 <= signal_in;
                //Change state
                state <= BRAM1_VERIFY_TRIGGER;
                //Set counters.
                counter <= 0;
                trigger_counter <= 0;
            end
         end
         //Here we wait to see if the trigger actually
         //holds.
         BRAM1_VERIFY_TRIGGER: begin
            //If the signal goes below trigger it doesn't hold.
            //All the wires are reset and go back to waiting for
            //the trigger.
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
               //Keep showing the old bram framw while
               //we verify
               frame2_addr <= (hcount_in - 'd101);
               signal_out <= data_from_frame2;
               //Write current signal while we verify
               data_to_frame1 <= signal_in;
               //If the count is above the needed high,
               //we can go to the next state where we wait
               //until the bram fills.
               if(trigger_counter >= NEEDED_HIGH) begin
                  state<= BRAM1_WAIT_FOR_FILL;
               end else begin
                  //Else we count up.
                  trigger_counter <= trigger_counter + 1;
               end
               //Counter in place to make sure that we wait
               //a certain period to put samples into the bram.
               //This lets us see signals of varying frequencies.
               if(counter == period) begin
                  frame1_addr <= frame1_addr + 1;
                  counter <= 0;
               end else begin
                  counter <= counter + 1;
               end
            end
         end
         //In this state we wait for the bram to capture all
         //of the data it needs.
         BRAM1_WAIT_FOR_FILL: begin
            //Keep displaying from second bram while we fill
            frame2_addr <= (hcount_in - 'd101);
            signal_out <= data_from_frame2;
            //Keep writing signal to bram 1
            data_to_frame1 <= signal_in;
            //If the addr becomes big enough we can move to 
            //next state.
            if(frame1_addr == 'd821) begin
               state<= BRAM1_WAIT_FOR_FRAME;
               write_frame1 <= 0;
            end else begin
               //Have the counter to make sure we are sampling
               //at the user given period.
               if(counter == period) begin
                  frame1_addr <= frame1_addr + 1;
                  counter <= 0;
               end else begin
                  counter <= counter + 1;
               end
            end
         end
         //In this state we wait for the fram to end before we switch
         //the brams.
         BRAM1_WAIT_FOR_FRAME: begin
            frame2_addr <= (hcount_in - 'd101);
            signal_out <= data_from_frame2;
            //If vcount gets to the last line, we switch the state
            if((vcount_in == 'd767)) begin
               state<= BRAM2_WAIT_FOR_TRIGGER;
            end
         end
         //The state machine from before is the exact same as above,
         //it just switches the role of bram1 and bram2. We would be
         //displaying from bram1 while bram2 is being written to.
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
