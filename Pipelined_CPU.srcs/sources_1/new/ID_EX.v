`timescale 1ns / 1ps

module ID_EX(
    input clk,
    input rst,
    input dm,
    input ld,
    input str,
    input reg_lit,
    input add_sub,
    input [31:0]r1_data,
    input [31:0]r2_data,
    input [31:0]sign_ex,
    input [2:0]r1,
    input [2:0]r2,
    input [2:0]r2_store,
    input [2:0]rd,
    output reg _dm = 1'b0,
    output reg _ld = 1'b0,
    output reg _str = 1'b0,
    output reg _reg_lit = 1'b0,
    output reg _add_sub = 1'b0,
    output reg [31:0]_r1_data = 32'h0,
    output reg [31:0]_r2_data = 32'h0,
    output reg [31:0]_sign_ex = 32'h0,
    output reg [2:0]_r1 = 3'h0,
    output reg [2:0]_r2 = 3'h0,
    output reg [2:0]_r2_store = 3'h0,
    output reg [2:0]_rd = 3'h0
    );
    
    always @(posedge clk) begin
        if(rst) begin
            _dm <= 1'b0;
            _ld <= 1'b0;
            _str <= 1'b0;
            _reg_lit <= 1'b0;
            _add_sub <= 1'b0;
            _r1_data <= 32'h0;
            _r2_data <= 32'h0;
            _sign_ex <= 32'h0;
            _r1 <= 3'h0;
            _r2 <= 3'h0;
            _r2_store <= 3'h0;
            _rd <= 3'h0;
        end
        else begin
            _dm <= dm;
            _ld <= ld;
            _str <= str;
            _reg_lit <= reg_lit;
            _add_sub <= add_sub;
            _r1_data <= r1_data;
            _r2_data <= r2_data;
            _sign_ex <= sign_ex;
            _r1 <= r1;
            _r2 <= r2;
            _r2_store <= r2_store;
            _rd <= rd;
        end
    end
endmodule
