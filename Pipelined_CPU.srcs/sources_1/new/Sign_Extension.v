`timescale 1ns / 1ps

module Sign_Extension(
    input [5:0]literal_6bit,
    output [31:0]literal_32bit
    );
    
    //Sign extend the input 12-bit literal to a 32-bit literal.
    assign literal_32bit = literal_6bit[5] ? 
               {26'h3FFFFFF, literal_6bit} : 
               {26'h0000000, literal_6bit};
endmodule
