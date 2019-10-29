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


// IP VLNV: xilinx.com:module_ref:IF_ID:1.0
// IP Revision: 1

(* X_CORE_INFO = "IF_ID,Vivado 2017.4" *)
(* CHECK_LICENSE_TYPE = "Pipelined_CPU_IF_ID_0_0,IF_ID,{}" *)
(* CORE_GENERATION_INFO = "Pipelined_CPU_IF_ID_0_0,IF_ID,{x_ipProduct=Vivado 2017.4,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=IF_ID,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Pipelined_CPU_IF_ID_0_0 (
  clk,
  rst,
  write,
  flush,
  inc_address,
  instruction,
  inc_adr,
  opcode,
  r1,
  r2,
  rd,
  lit_6bit,
  lit_12bit
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN Pipelined_CPU_clk" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire write;
input wire flush;
input wire [31 : 0] inc_address;
input wire [15 : 0] instruction;
output wire [31 : 0] inc_adr;
output wire [3 : 0] opcode;
output wire [2 : 0] r1;
output wire [2 : 0] r2;
output wire [2 : 0] rd;
output wire [5 : 0] lit_6bit;
output wire [11 : 0] lit_12bit;

  IF_ID inst (
    .clk(clk),
    .rst(rst),
    .write(write),
    .flush(flush),
    .inc_address(inc_address),
    .instruction(instruction),
    .inc_adr(inc_adr),
    .opcode(opcode),
    .r1(r1),
    .r2(r2),
    .rd(rd),
    .lit_6bit(lit_6bit),
    .lit_12bit(lit_12bit)
  );
endmodule
