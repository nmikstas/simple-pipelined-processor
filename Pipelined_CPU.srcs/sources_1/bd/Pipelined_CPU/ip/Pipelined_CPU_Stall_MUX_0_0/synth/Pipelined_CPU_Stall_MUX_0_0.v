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


// IP VLNV: xilinx.com:module_ref:Stall_MUX:1.0
// IP Revision: 1

(* X_CORE_INFO = "Stall_MUX,Vivado 2017.4" *)
(* CHECK_LICENSE_TYPE = "Pipelined_CPU_Stall_MUX_0_0,Stall_MUX,{}" *)
(* CORE_GENERATION_INFO = "Pipelined_CPU_Stall_MUX_0_0,Stall_MUX,{x_ipProduct=Vivado 2017.4,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Stall_MUX,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module Pipelined_CPU_Stall_MUX_0_0 (
  stall,
  dm,
  ld,
  str,
  reg_lit,
  add_sub,
  _dm,
  _ld,
  _str,
  _reg_lit,
  _add_sub
);

input wire stall;
input wire dm;
input wire ld;
input wire str;
input wire reg_lit;
input wire add_sub;
output wire _dm;
output wire _ld;
output wire _str;
output wire _reg_lit;
output wire _add_sub;

  Stall_MUX inst (
    .stall(stall),
    .dm(dm),
    .ld(ld),
    .str(str),
    .reg_lit(reg_lit),
    .add_sub(add_sub),
    ._dm(_dm),
    ._ld(_ld),
    ._str(_str),
    ._reg_lit(_reg_lit),
    ._add_sub(_add_sub)
  );
endmodule
