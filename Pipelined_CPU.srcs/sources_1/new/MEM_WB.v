`timescale 1ns / 1ps

module MEM_WB(
    input clk,
    input rst,
    input dm,
    input ld,
    input [31:0]dmem_out,
    input [31:0]alu_out,
    input [2:0]rd,
    output reg _dm = 1'b0,
    output reg _ld = 1'b0,
    output reg [31:0]_dmem_out = 32'h0,
    output reg [31:0]_alu_out = 32'h0,
    output reg [2:0]_rd = 3'h0
    );
    
    always @(posedge clk) begin
        if(rst) begin
            _dm <= 1'b0;
            _ld <= 1'b0;
            _dmem_out <= 32'h0;
            _alu_out <= 32'h0;
            _rd <= 3'h0;
        end
        else begin
            _dm <= dm;
            _ld <= ld;
            _dmem_out <= dmem_out;
            _alu_out <= alu_out;
            _rd <= rd;
        end
    end
endmodule
