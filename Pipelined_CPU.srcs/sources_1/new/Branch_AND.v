`timescale 1ns / 1ps

module Branch_AND(
    input compare,
    input branch_inst,
    output branch
    );
    
    assign branch = compare & branch_inst;
endmodule
