`timescale 1ns / 1ps

module Reg_MUX(
    input  s,
    input  [31:0]reg_file_out,
    input  [31:0]reg_data_in,
    output [31:0]reg_data_out
    );
    
    assign reg_data_out = s ? reg_data_in : reg_file_out;
endmodule
