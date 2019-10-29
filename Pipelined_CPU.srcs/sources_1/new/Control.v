`timescale 1ns / 1ps

module Control(
    input [3:0]opcode, //4-bit opcode.
    output dat_mem,    //Data memory read.
    output ld,         //Load register.
    output str,        //Data memory store.
    output brnch,      //Branch.
    output jmp,        //Jump.
    output reg_lit,    //Register/literal.
    output add_sub     //Addition/subtraction.
    );
    
    reg [6:0]control_out = 7'h00;
    
    assign {dat_mem, ld, str, brnch, jmp, reg_lit, add_sub} = control_out[6:0];
    
    always @(*) begin       
        case(opcode)                //dm  ld  str br  jmp lit add
            4'b0001: control_out = 7'b0___1___0___0___0___0___1; //ADD  (Same as MIPS).
            4'b0010: control_out = 7'b0___1___0___0___0___1___1; //ADDi (Same as MIPS).
            4'b0011: control_out = 7'b0___1___0___0___0___0___0; //SUB  (Same as MIPS).
            4'b0100: control_out = 7'b0___1___0___0___0___1___0; //SUBi (Same as MIPS).
            4'b0101: control_out = 7'b1___1___0___0___0___0___1; //LWr  (Not MIPS...Bonus instruction! Useful for arrays).
            4'b0110: control_out = 7'b1___1___0___0___0___1___1; //LW   (Same as MIPS).
            4'b0111: control_out = 7'b0___0___1___0___0___1___1; //SW   (Same as MIPS).
            4'b1000: control_out = 7'b0___0___0___0___1___0___0; //JMP  (Similar to MIPS but upper bits are 0).
            4'b1001: control_out = 7'b0___0___0___1___0___1___0; //BEQ  (Same as MIPS but r1, r2 swapped for simplicity).
            default: control_out = 7'b0___0___0___0___0___0___0; //NOP  (Same as MIPS).
        endcase
    end
endmodule
