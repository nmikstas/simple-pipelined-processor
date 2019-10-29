`timescale 1ns / 1ps

module Stall_MUX(
    input stall,
    input dm,
    input ld,
    input str,
    input reg_lit,
    input add_sub,    
    output reg _dm = 1'b0,
    output reg _ld = 1'b0,
    output reg _str = 1'b0,
    output reg _reg_lit = 1'b0,
    output reg _add_sub = 1'b0
    );
    
    always @(*) begin
        if(stall) begin
            {_dm, _ld, _str, _reg_lit, _add_sub} = 
            5'b00000;
        end
        else begin
            {_dm, _ld, _str, _reg_lit, _add_sub} =
            {dm, ld, str, reg_lit, add_sub};
        end
    end
endmodule
