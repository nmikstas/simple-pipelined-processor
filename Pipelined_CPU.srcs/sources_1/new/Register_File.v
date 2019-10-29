`timescale 1ns / 1ps

module Register_File#(REG0_INIT = 32'd0, REG1_INIT = 32'd1,
                      REG2_INIT = 32'd2, REG3_INIT = 32'd3, 
                      REG4_INIT = 32'd4, REG5_INIT = 32'd5,
                      REG6_INIT = 32'd6, REG7_INIT = 32'd7)
    (
    input clk,
    input rst,
    input we,
    input [2:0]r1,
    input [2:0]r2,
    input [2:0]rd,
    input [31:0]dat,
    output reg [31:0]r1_data = 32'h0,
    output reg [31:0]r2_data = 32'h0
    );
      
    //Create internal registers.
    reg [31:0]register0 = REG0_INIT;
    reg [31:0]register1 = REG1_INIT;
    reg [31:0]register2 = REG2_INIT;
    reg [31:0]register3 = REG3_INIT;
    reg [31:0]register4 = REG4_INIT;
    reg [31:0]register5 = REG5_INIT;
    reg [31:0]register6 = REG6_INIT;
    reg [31:0]register7 = REG7_INIT;
        
    //asynchronous read.
    always @(*) begin
        case(r1[2:0])
            3'b000:  r1_data = register0;
            3'b001:  r1_data = register1;
            3'b010:  r1_data = register2;
            3'b011:  r1_data = register3;
            3'b100:  r1_data = register4;
            3'b101:  r1_data = register5;
            3'b110:  r1_data = register6;
            3'b111:  r1_data = register7;
            default: r1_data = register0;
        endcase   
    end
    
    always @(*) begin
        case(r2[2:0])
            3'b000:  r2_data = register0;
            3'b001:  r2_data = register1;
            3'b010:  r2_data = register2;
            3'b011:  r2_data = register3;
            3'b100:  r2_data = register4;
            3'b101:  r2_data = register5;
            3'b110:  r2_data = register6;
            3'b111:  r2_data = register7;
            default: r2_data = register0;
        endcase   
    end
    
    //Synchronous write and reset.
    always @(posedge clk) begin
        //Restore memory to original values on reset.
        if(rst) begin
            register0 <= REG0_INIT;
            register1 <= REG1_INIT;
            register2 <= REG2_INIT;
            register3 <= REG3_INIT;
            register4 <= REG4_INIT;
            register5 <= REG5_INIT;
            register6 <= REG6_INIT;
            register7 <= REG7_INIT;
        end
        
        //write enable must be high.
        else if(we) begin
            if(rd == 3'b000) register0 <= dat;
            if(rd == 3'b001) register1 <= dat;
            if(rd == 3'b010) register2 <= dat;
            if(rd == 3'b011) register3 <= dat;
            if(rd == 3'b100) register4 <= dat;
            if(rd == 3'b101) register5 <= dat;
            if(rd == 3'b110) register6 <= dat;
            if(rd == 3'b111) register7 <= dat;
        end
    end
endmodule
