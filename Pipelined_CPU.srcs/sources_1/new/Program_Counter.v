`timescale 1ns / 1ps

module Program_Counter(
    input clk,
    input en,
    input rst,
    input [31:0]next_address,
    output reg [31:0]address = 32'h0
    );
    
    always @(posedge clk) begin
        if(rst) begin
            address <= 32'h0;
        end
        else if(en) begin
            address <= next_address;
        end
    end    
endmodule
