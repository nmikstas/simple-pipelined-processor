`timescale 1ns / 1ps

module Mem_MUX(
    input [1:0]s,
    input [31:0]normal,
    input [31:0]mem,
    input [31:0]wb,
    output reg [31:0]o = 32'h0
    );
    
    always @(*) begin
        case(s)
            2'b01:   o = wb;
            2'b10:   o = mem;
            default: o = normal;
        endcase    
    end
endmodule
