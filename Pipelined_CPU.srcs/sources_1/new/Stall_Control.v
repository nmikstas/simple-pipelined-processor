`timescale 1ns / 1ps

module Stall_Control(
    input branch,         //Branch instruction signal.
    input ID_EX_load,     //Execute stage load register signal.
    input ID_EX_dat_mem,  //Execute stage data memory signal.
    input EX_MEM_dat_mem, //Memory stage data memory signal.
    input [2:0]IF_ID_r1,  //Decode stage rs address.
    input [2:0]IF_ID_r2,  //Decode stage rt address.
    input [2:0]ID_EX_r2,  //Execute stage rt address.
    output stall_out,     //Stall signal out.
    output PC_en,         //Program counter enable.
    output IF_ID_write    //IF_ID piipeline register enable.
    );
    
    reg stall = 1'b0;
    
    assign stall_out = stall ? 1'b1 : 1'b0;
    assign PC_en = stall ? 1'b0 : 1'b1;
    assign IF_ID_write = stall ? 1'b0 : 1'b1;
    
    always @(*) begin
        //Branch stall.
        if(branch && (ID_EX_load || EX_MEM_dat_mem)) begin
            stall = 1'b1;
        end
        
        //Data memory read stall.
        else if(ID_EX_dat_mem && ((ID_EX_r2 == IF_ID_r1) || (ID_EX_r2 == IF_ID_r2))) begin
            stall = 1'b1;
        end
        else begin
            stall = 1'b0;
        end
    end
endmodule
