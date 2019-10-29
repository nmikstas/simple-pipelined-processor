`timescale 1ns / 1ps

module Forwarding_Logic(
    input WB_load,             //Write back stage register load bit.
    input WB_dm,               //Write back stage data memory bit.
    input MEM_load,            //Memory stage register load bit.
    input MEM_store,           //Memory stage memory store bit.
    input EX_reg_lit,          //Literal or register selection bit.
    input EX_store,            //Execute stage memory store bit.
    input [2:0]IF_ID_r1,       //Decode stage rs address.
    input [2:0]IF_ID_r2,       //Decode stage rt address.
    input [2:0]EX_r1,          //Execute stage rs address.
    input [2:0]EX_r2,          //Execute stage rt address.
    input [2:0]EX_r2_store,    //Execute stage original rt address.
    input [2:0]WB_rd,          //Write back stage rd address.
    input [2:0]MEM_r2_store,   //Memory stage original rt address.
    input [2:0]MEM_rd,         //Memory stage rd address.
    output reg [1:0]a = 2'b00, //ALU input 1 forwarding MUX control.
    output reg [1:0]b = 2'b00, //ALU input 2 forwarding MUX control.
    output reg [1:0]c = 2'b00, //Comparator input 1 forwarding MUX control.
    output reg [1:0]d = 2'b00, //Comparator input 2 forwarding MUX control.
    output reg [1:0]e = 2'b00, //Memory address input MUX control.
    output reg f = 1'b0,       //Memory data input MUX control.
    output reg rf_a = 1'b0,    //Register file output 1 MUX control.
    output reg rf_b = 1'b0     //Register file output 2 MUX control.
    );
    
    always @(*) begin
        /**********Data memory stage register write hazard***********/
        //Forward r1 from memory stage.
        a[1] = (MEM_load && (MEM_rd == EX_r1)) ? 1'b1 : 1'b0;
            
        //Forward r2 from memory stage. !EX_reg_lit ensures no false hazards detected.
        b[1] = (MEM_load && !EX_reg_lit && (MEM_rd == EX_r2)) ? 1'b1 : 1'b0;
        
        /***********Write back stage register write hazard***********/                       
        //Forward r1 from write back stage.
        if(WB_load && !a[1] && (WB_rd == EX_r1)) begin
            a[0] = 1'b1;
        end
        else begin
            a[0] = 1'b0;
        end
        
        //Forward r2 from write back stage. !EX_reg_lit ensures no false hazards detected.
        if(WB_load && !EX_reg_lit && !b[1] && (WB_rd == EX_r2)) begin
            b[0] = 1'b1;
        end
        else begin
            b[0] = 1'b0;
        end
        
        /*************Decode stage register write hazard*************/
        //Forward WB data to output of register file ports.
        if(WB_load && (WB_rd == IF_ID_r1)) begin
            rf_a = 1'b1;
        end
        else begin
            rf_a = 1'b0;
        end
            
        if(WB_load && (WB_rd == IF_ID_r2)) begin
            rf_b = 1'b1;
        end
        else begin
            rf_b = 1'b0;
        end
        
        /***************Data memory stage branch hazard**************/
        //Forward r1 from memory stage.
        c[1] = (MEM_load && (MEM_rd == IF_ID_r1)) ? 1'b1 : 1'b0;
                    
                //Forward r2 from memory stage.
        d[1] = (MEM_load && (MEM_rd == IF_ID_r2)) ? 1'b1 : 1'b0;
        
        /***************Write back stage branch hazard***************/
        //Forward r1 from write back stage.
        if(WB_load && !c[1] && (WB_rd == IF_ID_r1)) begin
            c[0] = 1'b1;
        end
        else begin
            c[0] = 1'b0;
        end
                
        //Forward r2 from write back stage.
        if(WB_load && !d[1] && (WB_rd == IF_ID_r2)) begin
            d[0] = 1'b1;
        end
        else begin
            d[0] = 1'b0;
        end
        
        /******************Data memory store hazard******************/
        //Forward from memory stage.
        e[1] = (MEM_load && (MEM_rd == EX_r2_store)) ? 1'b1 : 1'b0;
               
        /******************Write back store hazard*******************/
        //Forward from write back stage.
        if(WB_load && !e[1] && (WB_rd == EX_r2_store)) begin
            e[0] = 1'b1;
        end
        else begin
            e[0] = 1'b0;
        end
        
        /***********STR immediately following an LDR hazard**********/
        if(WB_dm && MEM_store && (MEM_r2_store == WB_rd)) begin
            f = 1'b1;
        end
        else begin
            f = 1'b0;
        end
    end  
endmodule
