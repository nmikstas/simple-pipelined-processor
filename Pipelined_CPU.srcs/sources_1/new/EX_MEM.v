`timescale 1ns / 1ps

module EX_MEM(
    input clk,
    input rst,
    input dm,
    input ld,
    input str,
    input [31:0]alu_out,
    input [31:0]dmem_data,
    input [2:0]r2_store,
    input [2:0]rd,
    output reg _dm = 1'b0,
    output reg _ld = 1'b0,
    output reg _str = 1'b0,
    output reg [31:0]_alu_out = 32'h0,
    output reg [31:0]_dmem_data = 32'h0,
    output reg [2:0]_r2_store = 3'h0,
    output reg [2:0]_rd = 3'h0
    );
    
    always @(posedge clk) begin
        if(rst) begin
            _dm <= 1'b0;
            _ld <= 1'b0;
            _str <= 1'b0;
            _alu_out <= 32'h0;
            _dmem_data <= 32'h0;
            _r2_store <= 3'h0;
            _rd <= 3'h0;
        end
        else begin
            _dm <= dm;
            _ld <= ld;
            _str <= str;
            _alu_out <= alu_out;
            _dmem_data <= dmem_data;
            _r2_store <= r2_store;
            _rd <= rd;
        end    
    end
endmodule
