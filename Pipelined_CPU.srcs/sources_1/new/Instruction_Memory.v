`timescale 1ns / 1ps

module Instruction_Memory#(parameter DEPTH_BITS = 6) (
    input  [31:0]address,
    output [15:0]instruction
    );
    
    reg [15:0]mem[(1 << DEPTH_BITS) - 1:0];
    integer i;
    
    initial begin
        //Ensure entire memory array is initialized.
        for (i=0; i<(1 << DEPTH_BITS); i=i+1) begin
            mem[i] = 0;
        end
        
        //Read in program.
        $readmemb("Instruction_Memory.dat", mem);
    end
    
    //Asynchronous read.
    assign instruction = mem[({1'b0, address[31:1]}) % (1 << DEPTH_BITS)];    
endmodule
