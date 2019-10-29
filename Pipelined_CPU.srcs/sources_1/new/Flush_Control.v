`timescale 1ns / 1ps

module Flush_Control(
    input branch, //Branch indicator.
    input jump,   //Jump indicator.
    input stall,  //Stall indicator.
    output flush  //Flush signal.
    );
    
    //Only flush if not stalled.
    assign flush = stall ? 1'b0 : jump | branch;
endmodule
