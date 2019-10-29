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


// IP VLNV: xilinx.com:module_ref:Forwarding_Logic:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module Pipelined_CPU_Forwarding_Logic_0_0 (
  WB_load,
  WB_dm,
  MEM_load,
  MEM_store,
  EX_reg_lit,
  EX_store,
  IF_ID_r1,
  IF_ID_r2,
  EX_r1,
  EX_r2,
  EX_r2_store,
  WB_rd,
  MEM_r2_store,
  MEM_rd,
  a,
  b,
  c,
  d,
  e,
  f,
  rf_a,
  rf_b
);

input wire WB_load;
input wire WB_dm;
input wire MEM_load;
input wire MEM_store;
input wire EX_reg_lit;
input wire EX_store;
input wire [2 : 0] IF_ID_r1;
input wire [2 : 0] IF_ID_r2;
input wire [2 : 0] EX_r1;
input wire [2 : 0] EX_r2;
input wire [2 : 0] EX_r2_store;
input wire [2 : 0] WB_rd;
input wire [2 : 0] MEM_r2_store;
input wire [2 : 0] MEM_rd;
output wire [1 : 0] a;
output wire [1 : 0] b;
output wire [1 : 0] c;
output wire [1 : 0] d;
output wire [1 : 0] e;
output wire f;
output wire rf_a;
output wire rf_b;

  Forwarding_Logic inst (
    .WB_load(WB_load),
    .WB_dm(WB_dm),
    .MEM_load(MEM_load),
    .MEM_store(MEM_store),
    .EX_reg_lit(EX_reg_lit),
    .EX_store(EX_store),
    .IF_ID_r1(IF_ID_r1),
    .IF_ID_r2(IF_ID_r2),
    .EX_r1(EX_r1),
    .EX_r2(EX_r2),
    .EX_r2_store(EX_r2_store),
    .WB_rd(WB_rd),
    .MEM_r2_store(MEM_r2_store),
    .MEM_rd(MEM_rd),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .rf_a(rf_a),
    .rf_b(rf_b)
  );
endmodule
