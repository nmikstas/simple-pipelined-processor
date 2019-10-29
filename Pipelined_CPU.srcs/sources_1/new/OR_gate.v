`timescale 1ns / 1ps

module OR_gate(
    input a,
    input b,
    output o
    );
    
    assign o = a | b;
endmodule
