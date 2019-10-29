`timescale 1ns / 1ps

module Branch_MUX(
    input branch_inst,
    input [2:0]r2,
    input [2:0]rd,
    output [2:0]r
    );
    
    assign r = branch_inst ? rd : r2;
endmodule
