module level_to_pulse (
    input wire clk,
    input wire level,
    output wire pulse);

    reg last_level;
    always @(posedge clk) begin
        last_level <= level;
    end
    assign pulse = level & ~last_level;

endmodule
