// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:Data_Memory:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module Pipelined_CPU_Data_Memory_0_0 (
  clk,
  rst,
  we,
  M_address,
  M_data_in,
  M_data_out,
  led,
  seg,
  an
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN Pipelined_CPU_clk" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire we;
input wire [31 : 0] M_address;
input wire [31 : 0] M_data_in;
output wire [31 : 0] M_data_out;
output wire [15 : 0] led;
output wire [6 : 0] seg;
output wire [7 : 0] an;

  Data_Memory #(
    .MEM00_INIT(32'H0000000c),
    .MEM01_INIT(32'H0000000a),
    .MEM02_INIT(32'H00000010),
    .MEM03_INIT(32'H00000002),
    .MEM04_INIT(32'H00000004),
    .MEM05_INIT(32'H00000006),
    .MEM06_INIT(32'H00000008),
    .MEM07_INIT(32'H0000000A),
    .MEM08_INIT(32'H0000000C),
    .MEM09_INIT(32'H0000000e),
    .MEM10_INIT(32'H00000010),
    .MEM11_INIT(32'H00000012),
    .MEM12_INIT(32'H00000014),
    .MEM13_INIT(32'H00000000),
    .MEM14_INIT(32'H00000000),
    .MEM15_INIT(32'H00000000),
    .MEM16_INIT(32'H00000000),
    .MEM17_INIT(32'H00000000),
    .MEM18_INIT(32'H00000000),
    .MEM19_INIT(32'H00000000),
    .MEM20_INIT(32'H00000000),
    .MEM21_INIT(32'H00000000),
    .MEM22_INIT(32'H00000000),
    .MEM23_INIT(32'H00000000),
    .MEM24_INIT(32'H00000000),
    .MEM25_INIT(32'H00000000),
    .MEM26_INIT(32'H00000000),
    .MEM27_INIT(32'H00000000),
    .MEM28_INIT(32'H00000000),
    .MEM29_INIT(32'H00000000),
    .MEM30_INIT(32'H0000001E),
    .MEM31_INIT(32'H0000001F)
  ) inst (
    .clk(clk),
    .rst(rst),
    .we(we),
    .M_address(M_address),
    .M_data_in(M_data_in),
    .M_data_out(M_data_out),
    .led(led),
    .seg(seg),
    .an(an)
  );
endmodule
