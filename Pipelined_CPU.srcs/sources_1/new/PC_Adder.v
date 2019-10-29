`timescale 1ns / 1ps

module PC_Adder(
    input [31:0]constnt,
    input [31:0]address,
    output [31:0]inc_address
    );
    
    assign inc_address = address + constnt;
endmodule
