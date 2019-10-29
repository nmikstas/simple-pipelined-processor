`timescale 1ns / 1ps

module Dmem_MUX(
    input s,
    input [31:0]reg_dat,
    input [31:0]dmem_dat,
    output [31:0]o
    );
    
    assign o = s ? dmem_dat : reg_dat;
endmodule
