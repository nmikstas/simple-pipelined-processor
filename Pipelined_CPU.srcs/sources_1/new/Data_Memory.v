`timescale 1ns / 1ps

module Data_Memory#(MEM00_INIT = 32'd0,  MEM01_INIT = 32'd1,
                    MEM02_INIT = 32'd2,  MEM03_INIT = 32'd3,
                    MEM04_INIT = 32'd4,  MEM05_INIT = 32'd5,
                    MEM06_INIT = 32'd6,  MEM07_INIT = 32'd7,
                    MEM08_INIT = 32'd8,  MEM09_INIT = 32'd9,
                    MEM10_INIT = 32'd10, MEM11_INIT = 32'd11,
                    MEM12_INIT = 32'd12, MEM13_INIT = 32'd13,
                    MEM14_INIT = 32'd14, MEM15_INIT = 32'd15,
                    MEM16_INIT = 32'd16, MEM17_INIT = 32'd17,
                    MEM18_INIT = 32'd18, MEM19_INIT = 32'd19,
                    MEM20_INIT = 32'd20, MEM21_INIT = 32'd21,
                    MEM22_INIT = 32'd22, MEM23_INIT = 32'd23,
                    MEM24_INIT = 32'd24, MEM25_INIT = 32'd25,
                    MEM26_INIT = 32'd26, MEM27_INIT = 32'd27,
                    MEM28_INIT = 32'd28, MEM29_INIT = 32'd29,
                    MEM30_INIT = 32'd30, MEM31_INIT = 32'd31)
    (
    input clk,
    input rst,
    input we,
    input [31:0]M_address,
    input [31:0]M_data_in,
    output reg [31:0]M_data_out = 32'h0,
    
    //LED and 7 segment outputs.
    output [15:0]led,
    output reg [6:0]seg = 7'h0,
    output [7:0]an
    );
    
    //7 segment display regs and wires.
    reg [16:0]clk_div = 17'h0;
    reg [7:0]an_driver = 8'b11111110;
    reg [3:0]seg7_input = 4'h0;
    reg ce1k = 1'b0;
    
    //Assign anode to drive.
    assign an = an_driver;
              
    //Create internal registers.
    reg [31:0]mem0  = MEM00_INIT;
    reg [31:0]mem1  = MEM01_INIT;
    reg [31:0]mem2  = MEM02_INIT;
    reg [31:0]mem3  = MEM03_INIT; 
    reg [31:0]mem4  = MEM04_INIT; 
    reg [31:0]mem5  = MEM05_INIT; 
    reg [31:0]mem6  = MEM06_INIT; 
    reg [31:0]mem7  = MEM07_INIT; 
    reg [31:0]mem8  = MEM08_INIT; 
    reg [31:0]mem9  = MEM09_INIT; 
    reg [31:0]mem10 = MEM10_INIT; 
    reg [31:0]mem11 = MEM11_INIT; 
    reg [31:0]mem12 = MEM12_INIT; 
    reg [31:0]mem13 = MEM13_INIT;
    reg [31:0]mem14 = MEM14_INIT; 
    reg [31:0]mem15 = MEM15_INIT;
    reg [31:0]mem16 = MEM16_INIT; 
    reg [31:0]mem17 = MEM17_INIT; 
    reg [31:0]mem18 = MEM18_INIT; 
    reg [31:0]mem19 = MEM19_INIT; 
    reg [31:0]mem20 = MEM20_INIT; 
    reg [31:0]mem21 = MEM21_INIT;
    reg [31:0]mem22 = MEM22_INIT; 
    reg [31:0]mem23 = MEM23_INIT;
    reg [31:0]mem24 = MEM24_INIT; 
    reg [31:0]mem25 = MEM25_INIT; 
    reg [31:0]mem26 = MEM26_INIT; 
    reg [31:0]mem27 = MEM27_INIT;
    reg [31:0]mem28 = MEM28_INIT;
    reg [31:0]mem29 = MEM29_INIT; 
    reg [31:0]mem30 = MEM30_INIT; 
    reg [31:0]mem31 = MEM31_INIT;  
    
    //mem31 controls the led output.
    assign led = mem31[15:0];
          
    //Asynchronous read.
    always @(*) begin
        case({2'b00, M_address[31:2]}) 
            32'h00000000: M_data_out = mem0;
            32'h00000001: M_data_out = mem1;
            32'h00000002: M_data_out = mem2;
            32'h00000003: M_data_out = mem3;
            32'h00000004: M_data_out = mem4;
            32'h00000005: M_data_out = mem5;
            32'h00000006: M_data_out = mem6;
            32'h00000007: M_data_out = mem7;
            32'h00000008: M_data_out = mem8;
            32'h00000009: M_data_out = mem9;
            32'h0000000a: M_data_out = mem10;
            32'h0000000b: M_data_out = mem11;
            32'h0000000c: M_data_out = mem12;
            32'h0000000d: M_data_out = mem13;
            32'h0000000e: M_data_out = mem14;
            32'h0000000f: M_data_out = mem15;
            32'h00000010: M_data_out = mem16;
            32'h00000011: M_data_out = mem17;
            32'h00000012: M_data_out = mem18;
            32'h00000013: M_data_out = mem19;
            32'h00000014: M_data_out = mem20;
            32'h00000015: M_data_out = mem21;
            32'h00000016: M_data_out = mem22;
            32'h00000017: M_data_out = mem23;
            32'h00000018: M_data_out = mem24;
            32'h00000019: M_data_out = mem25;
            32'h0000001a: M_data_out = mem26;
            32'h0000001b: M_data_out = mem27;
            32'h0000001c: M_data_out = mem28;
            32'h0000001d: M_data_out = mem29;
            32'h0000001e: M_data_out = mem30;
            32'h0000001f: M_data_out = mem31;   
            default: M_data_out = 32'h00000000;
        endcase
    end
               
    //Synchronous write and reset.
    always @(posedge clk) begin
        if(rst) begin
            mem0  <= MEM00_INIT;
            mem1  <= MEM01_INIT;
            mem2  <= MEM02_INIT;
            mem3  <= MEM03_INIT;
            mem4  <= MEM04_INIT;
            mem5  <= MEM05_INIT;
            mem6  <= MEM06_INIT;
            mem7  <= MEM07_INIT;
            mem8  <= MEM08_INIT;
            mem9  <= MEM09_INIT;
            mem10 <= MEM10_INIT;
            mem11 <= MEM11_INIT;
            mem12 <= MEM12_INIT;
            mem13 <= MEM13_INIT;
            mem14 <= MEM14_INIT;
            mem15 <= MEM15_INIT;
            mem16 <= MEM16_INIT;
            mem17 <= MEM17_INIT;
            mem18 <= MEM18_INIT;
            mem19 <= MEM19_INIT;
            mem20 <= MEM20_INIT;
            mem21 <= MEM21_INIT;
            mem22 <= MEM22_INIT;
            mem23 <= MEM23_INIT;
            mem24 <= MEM24_INIT;
            mem25 <= MEM25_INIT;
            mem26 <= MEM26_INIT;
            mem27 <= MEM27_INIT;
            mem28 <= MEM28_INIT;
            mem29 <= MEM29_INIT;
            mem30 <= MEM30_INIT;
            mem31 <= MEM31_INIT;
        end
            
        //write enable must be high.
        else if(we) begin
            if({2'b00, M_address[31:2]} == 32'h00000000) mem0 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000001) mem1 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000002) mem2 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000003) mem3 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000004) mem4 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000005) mem5 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000006) mem6 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000007) mem7 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000008) mem8 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000009) mem9 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000000a) mem10 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000000b) mem11 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000000c) mem12 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000000d) mem13 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000000e) mem14 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000000f) mem15 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000010) mem16 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000011) mem17 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000012) mem18 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000013) mem19 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000014) mem20 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000015) mem21 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000016) mem22 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000017) mem23 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000018) mem24 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h00000019) mem25 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000001a) mem25 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000001b) mem27 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000001c) mem28 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000001d) mem29 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000001e) mem30 <= M_data_in;
            if({2'b00, M_address[31:2]} == 32'h0000001f) mem31 <= M_data_in;
        end
    end
          
    //Create 1kHz clock enable
    always @(posedge clk) begin
        clk_div <= clk_div + 1'b1;
        
        //Count to 100000 and reset.
        if(clk_div == 17'd99999) begin
            clk_div <= 0;
            ce1k <= 1'b1;
        end
        
        //Reset.
        else begin
            ce1k <= 1'b0;
        end
        
        //Drive the next anode.
        if(ce1k) begin
            an_driver[0] <= an_driver[7];
            an_driver[7] <= an_driver[6];
            an_driver[6] <= an_driver[5];
            an_driver[5] <= an_driver[4];
            an_driver[4] <= an_driver[3];
            an_driver[3] <= an_driver[2];
            an_driver[2] <= an_driver[1];
            an_driver[1] <= an_driver[0];
        end
    end 
    
    //Choose which part of number to display.
    always @(*) begin
        case(an_driver)
            8'b11111110 : seg7_input = mem30[3:0];
            8'b11111101 : seg7_input = mem30[7:4];
            8'b11111011 : seg7_input = mem30[11:8];
            8'b11110111 : seg7_input = mem30[15:11];
            8'b11101111 : seg7_input = mem30[19:16];
            8'b11011111 : seg7_input = mem30[23:20];
            8'b10111111 : seg7_input = mem30[27:24];
            8'b01111111 : seg7_input = mem30[31:28];
            default : seg7_input = 4'b0000;       
        endcase
    end
    
    //Hex to 7 segment decoder.
    always @(*) begin
        case(seg7_input)
            4'b0000 : seg = ~7'b0111111; //0
            4'b0001 : seg = ~7'b0000110; //1
            4'b0010 : seg = ~7'b1011011; //2
            4'b0011 : seg = ~7'b1001111; //3
            4'b0100 : seg = ~7'b1100110; //4
            4'b0101 : seg = ~7'b1101101; //5
            4'b0110 : seg = ~7'b1111101; //6
            4'b0111 : seg = ~7'b0000111; //7
            4'b1000 : seg = ~7'b1111111; //8
            4'b1001 : seg = ~7'b1100111; //9
            4'b1010 : seg = ~7'b1110111; //A
            4'b1011 : seg = ~7'b1111100; //B
            4'b1100 : seg = ~7'b0111001; //C
            4'b1101 : seg = ~7'b1011110; //D
            4'b1110 : seg = ~7'b1111001; //E
            4'b1111 : seg = ~7'b1110001; //F
            default : seg = ~7'b0000000; //Blank   
        endcase    
    end        
endmodule
