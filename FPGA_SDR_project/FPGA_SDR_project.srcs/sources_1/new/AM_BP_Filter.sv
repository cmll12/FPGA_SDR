//////////////////////////////////////////////////////////////////////////////////
// Company: MIT
// Engineer: Charles Lindsay
// 
// Create Date: 11/22/2019 01:44:50 PM
// Design Name: 
// Module Name: AM_BP_Filter
//////////////////////////////////////////////////////////////////////////////////

module AM_BP_Filter #(parameter N = 8) //N = number of feedforward coeff, max 8
    (
        input clk_in,
        input rst,
        
        //coeffiecients multiplied by 2^16
        input signed [17:0] b [(N-1):0], //N b feedforward coeffs [b(N-1)...b0), unpacked array
        input signed [17:0] a [(N-2):0], //N-1 feedback coeffs [a(N-1)...a1], unpacked array
        input sample_ready, //ADC data valid
        input signed [23:0] sample, //IF_in 
        
        output logic signed [33:0] filt_out,
        output logic filt_valid //indicate new filter value available
    );
    
    logic signed [23:0] x [7:0]; //store past 8 x values, up to and including x[n]
    logic signed [100:0] y [7:0]; //store past 8 y values up to and inlcuding y[n-1]
   
    //pointer to x[n] and y[n-1] in x and y arrays
    logic [2:0] index; 
    //indicate begin calculating filter ouput
    logic sum_values;
    
    //used in computing x and y terms for filter output
    logic signed [100:0] x_sum;
    logic signed [100:0] y_sum;
    logic [3:0] ii;
    
    //ensures index overflow does not result in calling x or y at a negative val
    logic [2:0] val_index;
    assign val_index = index - ii;
    
    always_ff @(posedge clk_in) begin
        if (rst) begin
            //intialize x & y values to all 0
            for (int i=0; i<8; i=i+1) begin
                x[i] <= 0;
                y[i] <= 0; 
                //reset x and y sums
                x_sum <= 0;
                y_sum <= 0;
            end
            //reset current value pointer
            index <= 0;
        end else begin
            if (sample_ready) begin  
                //update x with most recent sample           
                x[index] <= sample[23:0];
                //start computing filter output, reset sums
                sum_values <= 1;
                //reset sum values
                x_sum <= 0;
                y_sum <= 0;
                //increment pointer index
                index <= index+1;
                //start ii at 1, since incrementing index 
                //therefore x[n] is at [index-1]
                ii <= 1;    
            end else begin //sample ready
            //calculate x and y sums for past N values
                if (sum_values && (ii <= N)) begin
                    x_sum <= x_sum + ( (x[val_index]*b[ii-1])>>>16 );
                    //only summing N-2 y terms
                    y_sum <= (ii <= (N-1)) ? ( y_sum + ( (y[val_index]*a[ii-1])>>>16 ) ) : y_sum; 
                    ii <= ii + 1;
                end else if (sum_values) begin
                    //stop summation
                    sum_values <= 0;
                    //compute filt_out
                    filt_out <= x_sum - y_sum;
                    filt_valid <= 1;
                    //store this to be used as previous value of y
                    y[index] <= x_sum - y_sum;
                end else begin
                    filt_valid <= 0;
                end //sum values     
            end //else sample ready
            
        end //rst else
    end //end always_ff


endmodule
