`timescale 1ns / 1ps

module Left_Shifter(
    input [31:0]i,
    output [31:0]o
    );
    
    //Left shift(multiply by 2).
    assign o = {i[30:0], 1'b0};
endmodule
