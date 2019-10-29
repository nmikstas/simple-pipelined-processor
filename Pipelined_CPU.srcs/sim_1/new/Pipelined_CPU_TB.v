`timescale 1ns / 1ps

module Pipelined_CPU_TB;
    reg clk = 1'b0;
    reg rst = 1'b0;
    
    wire [15:0]led;
    wire [6:0]seg;
    wire [7:0]an;
    
    Pipelined_CPU uut(.clk(clk), .rst(rst), .led(led), .seg(seg), .an(an));
    
    //initial begin
    //    #200 rst = 1'b1;
    //    #20  rst = 1'b0;
    //end
    
    always #5 clk = ~clk;
endmodule
