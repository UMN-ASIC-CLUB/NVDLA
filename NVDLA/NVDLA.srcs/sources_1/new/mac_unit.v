`timescale 1ns / 1ps
module mac_unit (
    input  wire        clk,
    input  wire        rst,
    input  wire signed [7:0]  weight,
    input  wire signed [7:0]  input_data,
    input  wire signed [31:0] acc_in,
    output reg  signed [31:0] acc_out
);

always @(posedge clk) begin
    if (rst)
        acc_out <= 0;
    else
        acc_out <= acc_in + (weight * input_data);
end

endmodule
