`timescale 1ns / 1ps

module Unsigned_Extension(
    input [11:0]literal_12bit,
    output [31:0]literal_32bit
    );
    
    assign literal_32bit =  {20'h00000, literal_12bit};
endmodule
