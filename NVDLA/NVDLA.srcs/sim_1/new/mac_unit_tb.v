`timescale 1ns / 1ps
module mac_unit_tb;

reg clk, rst;
reg signed [7:0] weight, input_data;
reg signed [31:0] acc_in;
wire signed [31:0] acc_out;

mac_unit uut (
    .clk(clk), .rst(rst),
    .weight(weight),
    .input_data(input_data),
    .acc_in(acc_in),
    .acc_out(acc_out)
);

always #5 clk = ~clk; // clock every 5ns

initial begin
    clk = 0; rst = 1; acc_in = 0;
    #10 rst = 0;
    
    // test: 3 * 4 = 12
    weight = 3; input_data = 4; acc_in = 0;
    #10;
    $display("3 * 4 + 0 = %d (expect 12)", acc_out);
    
    // test: accumulate, 12 + (2*5) = 22
    weight = 2; input_data = 5; acc_in = acc_out;
    #10;
    $display("2 * 5 + 12 = %d (expect 22)", acc_out);
    
    $finish;
end

endmodule
