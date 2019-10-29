`timescale 1ns / 1ps

module ALU(
    input [31:0]a,
    input [31:0]b,
    input add,
    output [31:0]s,
    output [3:0]nzcv
    );
    
    //ALU status flags.
    wire n, z, c, v;
    
    //Perform add or subtract with carry.
    assign {c, s} = add ? a + b : a + {1'b0, ~b + 1};
    
    //Assign zero flag.
    assign z = ~|s;
    
    //Assign negative flag.
    assign n = s[31];
    
    //Assign overflow flag.
    assign v = add ? a[31]&b[31]&~s[31]  | ~a[31]&~b[31]&s[31] :
                     a[31]&~b[31]&~s[31] | ~a[31]&b[31]&s[31];
    
    //Assign all the flags to a bus.
    assign nzcv = {n,z,c,v};
endmodule
