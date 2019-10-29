`timescale 1ns / 1ps

module PC_MUX(
    input branch_select,
    input jump_select,
    input [31:0]inc_address,
    input [31:0]branch_address,
    input [31:0]jump_address,
    output reg [31:0]next_address
    );
    
    always @(*) begin
        case({jump_select, branch_select})
            2'b01: next_address = branch_address;
            2'b10: next_address = jump_address;
            default: next_address = inc_address;
        endcase
    end    
endmodule
