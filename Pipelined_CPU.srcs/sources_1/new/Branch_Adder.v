`timescale 1ns / 1ps

module Branch_Adder(
    input  [31:0]pc_plus_4,
    input  [31:0]branch_in,
    output [31:0]branch_address
    );
    
    assign branch_address = branch_in + pc_plus_4;
endmodule
