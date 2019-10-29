`timescale 1ns / 1ps

module Forward_MUX(
    input [1:0]s,
    input [31:0]normal,
    input [31:0]MEM_WB_mux_out,
    input [31:0]EX_MEM_rd,
    output reg [31:0]o = 32'h0
    );
    
    always @(*) begin
        case(s)
            2'b01:   o = MEM_WB_mux_out;
            2'b10:   o = EX_MEM_rd;
            default: o = normal;
        endcase
    end
endmodule
