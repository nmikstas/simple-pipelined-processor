`timescale 1ns / 1ps

module Mem_DMUX(
    input s,
    input [31:0]MEM_mdata,
    input [31:0]WB_odata,
    output [31:0]odata
    );
    
    assign odata = s ? WB_odata : MEM_mdata;
endmodule
