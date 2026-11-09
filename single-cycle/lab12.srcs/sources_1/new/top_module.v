`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 12:09:13 AM
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module(
    input clk, reset
    );
    
    wire [31:0] instruction_start = 32'h8a5f4007;
    wire RegDst, RegWrite, ALUSrc, BEQ, MemWrite, MemToReg, JMP;
    wire [3:0] ALUop;
    wire [5:0] opcode, funct;
    
    control_unit mod1(clk, reset, opcode, funct, RegDst, RegWrite, ALUSrc, MemWrite, MemToReg, BEQ, Jump, ALUOp);
    mips_datapath mod2(clk, reset, instruction_start, RegDst, RegWrite, ALUSrc, BEQ, MemWrite, MemToReg, JMP, ALUop, opcode, funct);
    
endmodule
