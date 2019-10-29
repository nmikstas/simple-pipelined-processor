`timescale 1ns / 1ps

module IF_ID(
    input clk,
    input rst,
    input write,
    input flush,
    input [31:0]inc_address,
    input [15:0]instruction,
    output reg [31:0]inc_adr = 32'h00000000,
    output reg [3:0]opcode = 4'h0,
    output reg [2:0]r1 = 3'h0,
    output reg [2:0]r2 = 3'h0,
    output reg [2:0]rd = 3'h0,
    output reg [5:0]lit_6bit = 6'h00,
    output reg [11:0]lit_12bit = 12'h000
    );
    
    always @(posedge clk) begin
        if(rst) begin
            inc_adr <= 32'h00000000;
            opcode <= 4'h0;
            r1 <= 3'h0;
            r2 <= 3'h0;
            rd <= 3'h0;
            lit_6bit <= 6'h00;
            lit_12bit <= 12'h000;
        end
        else if(flush) begin
            opcode <= 4'h0;
            //inc_adr <= 32'h0;
            //r1 <= 32'h0;
            //r2 <= 3'h0;
            //rd <= 3'h0;
            //lit <= 6'h0;
        end
        else if(write) begin
            inc_adr <= inc_address;
            opcode    <= instruction[15:12];
            r1        <= instruction[8:6];
            r2        <= instruction[5:3];
            rd        <= instruction[11:9];
            lit_6bit  <= instruction[5:0];
            lit_12bit <= instruction[11:0];
        end
    end
endmodule
