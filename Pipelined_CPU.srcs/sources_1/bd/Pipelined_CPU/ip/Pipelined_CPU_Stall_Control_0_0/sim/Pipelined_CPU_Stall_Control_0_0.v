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


// IP VLNV: xilinx.com:module_ref:Stall_Control:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module Pipelined_CPU_Stall_Control_0_0 (
  branch,
  ID_EX_load,
  ID_EX_dat_mem,
  EX_MEM_dat_mem,
  IF_ID_r1,
  IF_ID_r2,
  ID_EX_r2,
  stall_out,
  PC_en,
  IF_ID_write
);

input wire branch;
input wire ID_EX_load;
input wire ID_EX_dat_mem;
input wire EX_MEM_dat_mem;
input wire [2 : 0] IF_ID_r1;
input wire [2 : 0] IF_ID_r2;
input wire [2 : 0] ID_EX_r2;
output wire stall_out;
output wire PC_en;
output wire IF_ID_write;

  Stall_Control inst (
    .branch(branch),
    .ID_EX_load(ID_EX_load),
    .ID_EX_dat_mem(ID_EX_dat_mem),
    .EX_MEM_dat_mem(EX_MEM_dat_mem),
    .IF_ID_r1(IF_ID_r1),
    .IF_ID_r2(IF_ID_r2),
    .ID_EX_r2(ID_EX_r2),
    .stall_out(stall_out),
    .PC_en(PC_en),
    .IF_ID_write(IF_ID_write)
  );
endmodule
