//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Oct 29 13:32:12 2019
//Host        : Test running 64-bit major release  (build 9200)
//Command     : generate_target Pipelined_CPU.bd
//Design      : Pipelined_CPU
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "Pipelined_CPU,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Pipelined_CPU,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=35,numReposBlks=35,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=34,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "Pipelined_CPU.hwdef" *) 
module Pipelined_CPU
   (an,
    clk,
    led,
    rst,
    seg);
  output [7:0]an;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN Pipelined_CPU_clk, FREQ_HZ 100000000, PHASE 0.000" *) input clk;
  output [15:0]led;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, POLARITY ACTIVE_LOW" *) input rst;
  output [6:0]seg;

  wire [31:0]ALU_0_s;
  wire [31:0]ALU_MUX_0_o;
  wire Branch_AND_0_branch;
  wire [31:0]Branch_Adder_0_branch_address;
  wire [2:0]Branch_MUX_0_r;
  wire Compare_eq;
  wire [31:0]Constant_2_dout;
  wire Control_add_sub;
  wire Control_brnch;
  wire Control_dat_mem;
  wire Control_jmp;
  wire Control_ld;
  wire Control_reg_lit;
  wire Control_str;
  wire [31:0]Data_Memory_0_M_data_out;
  wire [7:0]Data_Memory_0_an;
  wire [15:0]Data_Memory_0_led;
  wire [6:0]Data_Memory_0_seg;
  wire [31:0]Dmem_MUX_0_o;
  wire [31:0]EX_MEM_0__alu_out;
  wire EX_MEM_0__dm;
  wire [31:0]EX_MEM_0__dmem_data;
  wire EX_MEM_0__ld;
  wire [2:0]EX_MEM_0__r2_store;
  wire [2:0]EX_MEM_0__rd;
  wire EX_MEM_0__str;
  wire Flush_Control_0_flush;
  wire [31:0]Forward_MUX_0_o;
  wire [31:0]Forward_MUX_1_o;
  wire [31:0]Forward_MUX_2_o;
  wire [31:0]Forward_MUX_3_o;
  wire [1:0]Forwarding_Logic_0_a;
  wire [1:0]Forwarding_Logic_0_b;
  wire [1:0]Forwarding_Logic_0_c;
  wire [1:0]Forwarding_Logic_0_d;
  wire [1:0]Forwarding_Logic_0_e;
  wire Forwarding_Logic_0_f;
  wire Forwarding_Logic_0_rf_a;
  wire Forwarding_Logic_0_rf_b;
  wire ID_EX_0__add_sub;
  wire ID_EX_0__dm;
  wire ID_EX_0__ld;
  wire [2:0]ID_EX_0__r1;
  wire [31:0]ID_EX_0__r1_data;
  wire [2:0]ID_EX_0__r2;
  wire [31:0]ID_EX_0__r2_data;
  wire [2:0]ID_EX_0__r2_store;
  wire [2:0]ID_EX_0__rd;
  wire ID_EX_0__reg_lit;
  wire [31:0]ID_EX_0__sign_ex;
  wire ID_EX_0__str;
  wire [31:0]IF_ID_inc_adr;
  wire [5:0]IF_ID_lit;
  wire [11:0]IF_ID_lit_12bit;
  wire [3:0]IF_ID_opcode;
  wire [2:0]IF_ID_r1;
  wire [2:0]IF_ID_r2;
  wire [2:0]IF_ID_rd;
  wire [15:0]Instruction_Memory_instruction;
  wire [31:0]Left_Shifter_o;
  wire [31:0]MEM_WB_0__alu_out;
  wire MEM_WB_0__dm;
  wire [31:0]MEM_WB_0__dmem_out;
  wire MEM_WB_0__ld;
  wire [2:0]MEM_WB_0__rd;
  wire [31:0]Mem_DMUX_0_odata;
  wire [31:0]Mem_MUX_0_o;
  wire [31:0]Net;
  wire OR_gate_o;
  wire [31:0]PC_MUX_0_next_address;
  wire [31:0]Program_Counter_address;
  wire [31:0]Register_File_r1_data;
  wire [31:0]Register_File_r1_data1;
  wire [31:0]Register_File_r2_data;
  wire [31:0]Register_File_r2_data1;
  wire [31:0]Sign_Extension_0_literal_32bit;
  wire Stall_Control_0_IF_ID_write;
  wire Stall_Control_0_PC_en;
  wire Stall_Control_0_stall_out;
  wire Stall_MUX_0__add_sub;
  wire Stall_MUX_0__dm;
  wire Stall_MUX_0__ld;
  wire Stall_MUX_0__reg_lit;
  wire Stall_MUX_0__str;
  wire [31:0]Unsigned_Extension_0_literal_32bit;
  wire clk_1;
  wire rst_1;

  assign an[7:0] = Data_Memory_0_an;
  assign clk_1 = clk;
  assign led[15:0] = Data_Memory_0_led;
  assign rst_1 = rst;
  assign seg[6:0] = Data_Memory_0_seg;
  Pipelined_CPU_ALU_0_0 ALU_0
       (.a(Forward_MUX_2_o),
        .add(ID_EX_0__add_sub),
        .b(Forward_MUX_3_o),
        .s(ALU_0_s));
  Pipelined_CPU_ALU_MUX_0_0 ALU_MUX_0
       (.lit(ID_EX_0__sign_ex),
        .o(ALU_MUX_0_o),
        .r2(ID_EX_0__r2_data),
        .s(ID_EX_0__reg_lit));
  Pipelined_CPU_Branch_AND_0_0 Branch_AND
       (.branch(Branch_AND_0_branch),
        .branch_inst(Control_brnch),
        .compare(Compare_eq));
  Pipelined_CPU_Branch_Adder_0_0 Branch_Adder
       (.branch_address(Branch_Adder_0_branch_address),
        .branch_in(Left_Shifter_o),
        .pc_plus_4(IF_ID_inc_adr));
  Pipelined_CPU_Branch_MUX_0_0 Branch_MUX_0
       (.branch_inst(OR_gate_o),
        .r(Branch_MUX_0_r),
        .r2(IF_ID_r2),
        .rd(IF_ID_rd));
  Pipelined_CPU_Compare_0_0 Compare
       (.eq(Compare_eq),
        .r1(Forward_MUX_0_o),
        .r2(Forward_MUX_1_o));
  Pipelined_CPU_xlconstant_0_0 Constant_2
       (.dout(Constant_2_dout));
  Pipelined_CPU_Control_0_0 Control
       (.add_sub(Control_add_sub),
        .brnch(Control_brnch),
        .dat_mem(Control_dat_mem),
        .jmp(Control_jmp),
        .ld(Control_ld),
        .opcode(IF_ID_opcode),
        .reg_lit(Control_reg_lit),
        .str(Control_str));
  Pipelined_CPU_Data_Memory_0_0 Data_Memory_0
       (.M_address(EX_MEM_0__alu_out),
        .M_data_in(Mem_DMUX_0_odata),
        .M_data_out(Data_Memory_0_M_data_out),
        .an(Data_Memory_0_an),
        .clk(clk_1),
        .led(Data_Memory_0_led),
        .rst(rst_1),
        .seg(Data_Memory_0_seg),
        .we(EX_MEM_0__str));
  Pipelined_CPU_Dmem_MUX_0_0 Dmem_MUX_0
       (.dmem_dat(MEM_WB_0__dmem_out),
        .o(Dmem_MUX_0_o),
        .reg_dat(MEM_WB_0__alu_out),
        .s(MEM_WB_0__dm));
  Pipelined_CPU_EX_MEM_0_0 EX_MEM_0
       (._alu_out(EX_MEM_0__alu_out),
        ._dm(EX_MEM_0__dm),
        ._dmem_data(EX_MEM_0__dmem_data),
        ._ld(EX_MEM_0__ld),
        ._r2_store(EX_MEM_0__r2_store),
        ._rd(EX_MEM_0__rd),
        ._str(EX_MEM_0__str),
        .alu_out(ALU_0_s),
        .clk(clk_1),
        .dm(ID_EX_0__dm),
        .dmem_data(Mem_MUX_0_o),
        .ld(ID_EX_0__ld),
        .r2_store(ID_EX_0__r2_store),
        .rd(ID_EX_0__rd),
        .rst(rst_1),
        .str(ID_EX_0__str));
  Pipelined_CPU_Flush_Control_0_0 Flush_Control
       (.branch(Branch_AND_0_branch),
        .flush(Flush_Control_0_flush),
        .jump(Control_jmp),
        .stall(Stall_Control_0_stall_out));
  Pipelined_CPU_Forward_MUX_0_0 Forward_MUX_0
       (.EX_MEM_rd(EX_MEM_0__alu_out),
        .MEM_WB_mux_out(Dmem_MUX_0_o),
        .normal(Register_File_r1_data),
        .o(Forward_MUX_0_o),
        .s(Forwarding_Logic_0_c));
  Pipelined_CPU_Forward_MUX_0_1 Forward_MUX_1
       (.EX_MEM_rd(EX_MEM_0__alu_out),
        .MEM_WB_mux_out(Dmem_MUX_0_o),
        .normal(Register_File_r2_data),
        .o(Forward_MUX_1_o),
        .s(Forwarding_Logic_0_d));
  Pipelined_CPU_Forward_MUX_0_2 Forward_MUX_2
       (.EX_MEM_rd(EX_MEM_0__alu_out),
        .MEM_WB_mux_out(Dmem_MUX_0_o),
        .normal(ID_EX_0__r1_data),
        .o(Forward_MUX_2_o),
        .s(Forwarding_Logic_0_a));
  Pipelined_CPU_Forward_MUX_0_3 Forward_MUX_3
       (.EX_MEM_rd(EX_MEM_0__alu_out),
        .MEM_WB_mux_out(Dmem_MUX_0_o),
        .normal(ALU_MUX_0_o),
        .o(Forward_MUX_3_o),
        .s(Forwarding_Logic_0_b));
  Pipelined_CPU_Forwarding_Logic_0_0 Forwarding_Logic_0
       (.EX_r1(ID_EX_0__r1),
        .EX_r2(ID_EX_0__r2),
        .EX_r2_store(ID_EX_0__r2_store),
        .EX_reg_lit(ID_EX_0__reg_lit),
        .EX_store(ID_EX_0__str),
        .IF_ID_r1(IF_ID_r1),
        .IF_ID_r2(Branch_MUX_0_r),
        .MEM_load(EX_MEM_0__ld),
        .MEM_r2_store(EX_MEM_0__r2_store),
        .MEM_rd(EX_MEM_0__rd),
        .MEM_store(EX_MEM_0__str),
        .WB_dm(MEM_WB_0__dm),
        .WB_load(MEM_WB_0__ld),
        .WB_rd(MEM_WB_0__rd),
        .a(Forwarding_Logic_0_a),
        .b(Forwarding_Logic_0_b),
        .c(Forwarding_Logic_0_c),
        .d(Forwarding_Logic_0_d),
        .e(Forwarding_Logic_0_e),
        .f(Forwarding_Logic_0_f),
        .rf_a(Forwarding_Logic_0_rf_a),
        .rf_b(Forwarding_Logic_0_rf_b));
  Pipelined_CPU_ID_EX_0_0 ID_EX_0
       (._add_sub(ID_EX_0__add_sub),
        ._dm(ID_EX_0__dm),
        ._ld(ID_EX_0__ld),
        ._r1(ID_EX_0__r1),
        ._r1_data(ID_EX_0__r1_data),
        ._r2(ID_EX_0__r2),
        ._r2_data(ID_EX_0__r2_data),
        ._r2_store(ID_EX_0__r2_store),
        ._rd(ID_EX_0__rd),
        ._reg_lit(ID_EX_0__reg_lit),
        ._sign_ex(ID_EX_0__sign_ex),
        ._str(ID_EX_0__str),
        .add_sub(Stall_MUX_0__add_sub),
        .clk(clk_1),
        .dm(Stall_MUX_0__dm),
        .ld(Stall_MUX_0__ld),
        .r1(IF_ID_r1),
        .r1_data(Register_File_r1_data),
        .r2(IF_ID_r2),
        .r2_data(Register_File_r2_data),
        .r2_store(Branch_MUX_0_r),
        .rd(IF_ID_rd),
        .reg_lit(Stall_MUX_0__reg_lit),
        .rst(rst_1),
        .sign_ex(Sign_Extension_0_literal_32bit),
        .str(Stall_MUX_0__str));
  Pipelined_CPU_IF_ID_0_0 IF_ID
       (.clk(clk_1),
        .flush(Flush_Control_0_flush),
        .inc_address(Net),
        .inc_adr(IF_ID_inc_adr),
        .instruction(Instruction_Memory_instruction),
        .lit_12bit(IF_ID_lit_12bit),
        .lit_6bit(IF_ID_lit),
        .opcode(IF_ID_opcode),
        .r1(IF_ID_r1),
        .r2(IF_ID_r2),
        .rd(IF_ID_rd),
        .rst(rst_1),
        .write(Stall_Control_0_IF_ID_write));
  Pipelined_CPU_Instruction_Memory_0_0 Instruction_Memory
       (.address(Program_Counter_address),
        .instruction(Instruction_Memory_instruction));
  Pipelined_CPU_Left_Shifter_0_0 Left_Shifter
       (.i(Sign_Extension_0_literal_32bit),
        .o(Left_Shifter_o));
  Pipelined_CPU_MEM_WB_0_0 MEM_WB_0
       (._alu_out(MEM_WB_0__alu_out),
        ._dm(MEM_WB_0__dm),
        ._dmem_out(MEM_WB_0__dmem_out),
        ._ld(MEM_WB_0__ld),
        ._rd(MEM_WB_0__rd),
        .alu_out(EX_MEM_0__alu_out),
        .clk(clk_1),
        .dm(EX_MEM_0__dm),
        .dmem_out(Data_Memory_0_M_data_out),
        .ld(EX_MEM_0__ld),
        .rd(EX_MEM_0__rd),
        .rst(rst_1));
  Pipelined_CPU_Mem_DMUX_0_0 Mem_DMUX_0
       (.MEM_mdata(EX_MEM_0__dmem_data),
        .WB_odata(Dmem_MUX_0_o),
        .odata(Mem_DMUX_0_odata),
        .s(Forwarding_Logic_0_f));
  Pipelined_CPU_Mem_MUX_0_1 Mem_MUX_0
       (.mem(EX_MEM_0__alu_out),
        .normal(ID_EX_0__r2_data),
        .o(Mem_MUX_0_o),
        .s(Forwarding_Logic_0_e),
        .wb(Dmem_MUX_0_o));
  Pipelined_CPU_OR_gate_0_0 OR_gate
       (.a(Control_brnch),
        .b(Control_str),
        .o(OR_gate_o));
  Pipelined_CPU_PC_Adder_0_0 PC_Adder
       (.address(Program_Counter_address),
        .constnt(Constant_2_dout),
        .inc_address(Net));
  Pipelined_CPU_PC_MUX_0_1 PC_MUX
       (.branch_address(Branch_Adder_0_branch_address),
        .branch_select(Branch_AND_0_branch),
        .inc_address(Net),
        .jump_address(Unsigned_Extension_0_literal_32bit),
        .jump_select(Control_jmp),
        .next_address(PC_MUX_0_next_address));
  Pipelined_CPU_Program_Counter_0_0 Program_Counter
       (.address(Program_Counter_address),
        .clk(clk_1),
        .en(Stall_Control_0_PC_en),
        .next_address(PC_MUX_0_next_address),
        .rst(rst_1));
  Pipelined_CPU_Reg_MUX_0_0 Reg_MUX_A
       (.reg_data_in(Dmem_MUX_0_o),
        .reg_data_out(Register_File_r1_data),
        .reg_file_out(Register_File_r1_data1),
        .s(Forwarding_Logic_0_rf_a));
  Pipelined_CPU_Reg_MUX_0_1 Reg_MUX_B
       (.reg_data_in(Dmem_MUX_0_o),
        .reg_data_out(Register_File_r2_data),
        .reg_file_out(Register_File_r2_data1),
        .s(Forwarding_Logic_0_rf_b));
  Pipelined_CPU_Register_File_0_0 Register_File
       (.clk(clk_1),
        .dat(Dmem_MUX_0_o),
        .r1(IF_ID_r1),
        .r1_data(Register_File_r1_data1),
        .r2(Branch_MUX_0_r),
        .r2_data(Register_File_r2_data1),
        .rd(MEM_WB_0__rd),
        .rst(rst_1),
        .we(MEM_WB_0__ld));
  Pipelined_CPU_Sign_Extension_0_0 Sign_Extension
       (.literal_32bit(Sign_Extension_0_literal_32bit),
        .literal_6bit(IF_ID_lit));
  Pipelined_CPU_Stall_Control_0_0 Stall_Control_0
       (.EX_MEM_dat_mem(EX_MEM_0__dm),
        .ID_EX_dat_mem(ID_EX_0__dm),
        .ID_EX_load(ID_EX_0__ld),
        .ID_EX_r2(ID_EX_0__rd),
        .IF_ID_r1(IF_ID_r1),
        .IF_ID_r2(IF_ID_r2),
        .IF_ID_write(Stall_Control_0_IF_ID_write),
        .PC_en(Stall_Control_0_PC_en),
        .branch(Control_brnch),
        .stall_out(Stall_Control_0_stall_out));
  Pipelined_CPU_Stall_MUX_0_0 Stall_MUX
       (._add_sub(Stall_MUX_0__add_sub),
        ._dm(Stall_MUX_0__dm),
        ._ld(Stall_MUX_0__ld),
        ._reg_lit(Stall_MUX_0__reg_lit),
        ._str(Stall_MUX_0__str),
        .add_sub(Control_add_sub),
        .dm(Control_dat_mem),
        .ld(Control_ld),
        .reg_lit(Control_reg_lit),
        .stall(Stall_Control_0_stall_out),
        .str(Control_str));
  Pipelined_CPU_Unsigned_Extension_0_0 Unsigned_Extension_0
       (.literal_12bit(IF_ID_lit_12bit),
        .literal_32bit(Unsigned_Extension_0_literal_32bit));
endmodule
