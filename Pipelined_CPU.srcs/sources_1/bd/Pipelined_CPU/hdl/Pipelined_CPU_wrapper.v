//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Oct 29 13:32:12 2019
//Host        : Test running 64-bit major release  (build 9200)
//Command     : generate_target Pipelined_CPU_wrapper.bd
//Design      : Pipelined_CPU_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Pipelined_CPU_wrapper
   (an,
    clk,
    led,
    rst,
    seg);
  output [7:0]an;
  input clk;
  output [15:0]led;
  input rst;
  output [6:0]seg;

  wire [7:0]an;
  wire clk;
  wire [15:0]led;
  wire rst;
  wire [6:0]seg;

  Pipelined_CPU Pipelined_CPU_i
       (.an(an),
        .clk(clk),
        .led(led),
        .rst(rst),
        .seg(seg));
endmodule
