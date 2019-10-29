`timescale 1ns / 1ps

module Compare(
    input  [31:0]r1,
    input  [31:0]r2,
    output eq
    );
    
    assign eq = (r1 == r2) ? 1'b1 : 1'b0;
endmodule
