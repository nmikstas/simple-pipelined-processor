`timescale 1ns / 1ps

module ALU_MUX(
    input s,
    input [31:0]r2,
    input [31:0]lit,
    output [31:0]o
    );
    
    assign o = s ? lit : r2;
endmodule
