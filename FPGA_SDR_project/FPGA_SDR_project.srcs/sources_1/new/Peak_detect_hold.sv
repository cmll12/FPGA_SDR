//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 11/26/2019 07:39:52 PM
// Design Name: 
// Module Name: Peak_detect_hold
//////////////////////////////////////////////////////////////////////////////////


module Peak_detect_hold(
        input clk,
        input rst,
        
        input sample_ready,
        input signed [33:0] sample_in,
        
        output logic [34:0] peak_value,
        output logic sample_ready_out
    );
    
    logic signed [33:0] past_val [7:0]; //store past 8 values
    logic deriv [7:0]; //store past 8 derivatives
    logic [2:0] index; //store index in past_val
    
    //calculates sum of derivatives
    logic [3:0] deriv_sum;
    assign deriv_sum = deriv[7]+deriv[6]+deriv[5]+deriv[4]+deriv[3]+deriv[2]+deriv[1]+deriv[0];
     
    //calculate sum of values to determine current sign
    logic signed [40:0] val_sum;
    assign val_sum = past_val[7]+past_val[6]+past_val[5]+past_val[4]+past_val[3]+
                        past_val[2]+past_val[1]+past_val[0];
    
    logic signed [33:0] extrema;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            deriv <= '{0,0,0,0,0,0,0,0};
            past_val <= '{0,0,0,0,0,0,0,0};
            index <= 0;
        end else begin
            if (sample_ready) begin
                //store current sample at index in array
                past_val[index] <= sample_in;
                //deriv = 1 if positive, 0 if negative
                if (index >= 1) begin
                    deriv[index] <= ( (sample_in - past_val[index-1]) >= 0 );
                end else begin
                    deriv[index] <= ( (sample_in - past_val[7]) >= 0 );
                end
                //increment index. Will overflow once reaches 7
                index <= index + 1;
            end //sample_ready
        end //rst
    end //always_ff
    
    logic [3:0] s_index;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            s_index <= 0;
            extrema <= 0;
            peak_value <= 0;
            sample_ready_out <= 0;
        end else begin
           //peak detected if 5 positives & 5 negative derivatives
            //find and output max or min value, stop if searched all index
            if (deriv_sum == 5 && s_index < 8 ) begin
                //if > 0, search for peak (max)
                if (val_sum >= 0) begin
                    //if value at index is greater than previous, set extrema to that. otherwise set
                    //equal to current extrema value
                    extrema <= ( past_val[s_index] > extrema ) ? past_val[s_index] : extrema;
                end else begin  //if < 0, look for trough (min). Also multiply value by -1
                    extrema <= ( past_val[s_index] < extrema ) ? past_val[s_index] : extrema;
                end 
                //increment search index
                s_index <= s_index + 1;
            end else begin 
                //reset search index
                s_index <= 0;
                //reset extrema to 0
                extrema <= 0;
                //reset extrema to past_vals[0] if in positive region, otherwise -past_vals[0]
//                if (val_sum >= 0) extrema <= past_val[s_index - 1];
//                else extrema <= (-'sd1)*past_val[s_index - 1];             
            end
            
            //peak_Value only re-assigned once finishing searching all values, then holds
            //until after next search. Also converts from signed to unsigned variable
            if (s_index == 8) begin
                peak_value <= (extrema >= 0) ? extrema : -'sd1*extrema;
                //assert sample for 1 clk cycle
                sample_ready_out <= 1;
            end else sample_ready_out <= 0;
    
        end //!rst
        
    end //always_ff
    
endmodule
