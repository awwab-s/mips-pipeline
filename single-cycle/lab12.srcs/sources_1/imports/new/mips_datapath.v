`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 02:20:57 AM
// Design Name: 
// Module Name: mips_datapath
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


module mips_datapath( //module for mips datapath
    input clk,
    input reset,
    input [31:0] instruction_start,
    
    input RegDst, RegWrite, ALUSrc, BEQ, MemWrite, MemToReg, JMP,
    input [3:0] ALUop,
    
    output [5:0] opcode, funct
    );
    
    //wires, component outputs (data inputs, outputs, and pins)
    wire [31:0] w_pcout, w_instruction;
    wire [4:0] rs, rt, rd, w_mux5bit_out;
    wire [15:0] offset;
    wire [25:0] jump;
    wire [31:0] w_shiftleft26_out;
    wire [31:0] w_RFDout1, w_RFDout2, w_signext_out;
    wire [31:0] w_ALUSrcOut, w_ALUResult, w_DMem_DataOut, w_muxMemToReg_out;
    wire [31:0] w_adder1out, w_adder2out, w_shiftleft1out, w_shiftleft2out, w_concat_out, w_muxbrn_out, w_muxjmp_out;
    wire w_zero, branch;
    
    
    
    
    ///////////////////////////////////IF///////////////////////////////////
    pc s1(reset, instruction_start, w_pcout);
    
    instructionMemory s2(w_pcout, w_instruction);
    adder s3(4, w_pcout, w_adder1out);
    ///////////////////////////////////ID///////////////////////////////////
    assign rs = w_instruction[25:21];
    assign rt = w_instruction[20:16];
    assign rd = w_instruction[15:11];
    assign offset = w_instruction[15:0];
    assign jump = w_instruction[25:0];
    assign branch = BEQ & w_zero;
    
    assign opcode = w_instruction[31:26];
    assign funct = w_instruction[5:0];
    
    mux_2x1_5bit s4(RegDst, rd, rt, w_mux5bit_out);
    registerFile s5(RegWrite, rs, rt, w_mux5bit_out, w_muxMemToReg_out, w_RFDout1, w_RFDout2);
    
    sign_extend s6(offset, w_signext_out);
    
    shift_left_2 s7(jump, w_shiftleft2out[27:0]);
    concat s8(w_shiftleft2out[27:0], w_adder1out[31:28], w_concat_out);
    ///////////////////////////////////EX///////////////////////////////////
    mux_2x1_32bit s9(ALUSrc, w_signext_out, w_RFDout2, w_ALUSrcOut);
    alu s10(ALUop, w_RFDout1, w_ALUSrcOut, w_ALUResult, w_zero);
    
    shift_left_2 s11(w_signext_out, w_shiftleft1out);
    adder s12(w_adder1out, w_shiftleft1out, w_adder2out);
    ///////////////////////////////////MEM//////////////////////////////////
    dataMemory s13(MemWrite, w_ALUResult, w_RFDout2, w_DMem_DataOut);
    
    mux_2x1_32bit s14(branch, w_adder2out, w_adder1out, w_muxbrn_out);
    
    mux_2x1_32bit s15(JMP, w_concat_out, w_muxbrn_out, w_muxjmp_out);
    ///////////////////////////////////WB///////////////////////////////////
    mux_2x1_32bit s16(MemToReg, w_DMem_DataOut, w_ALUResult, w_muxMemToReg_out);
    ////////////////////////////////////////////////////////////////////////
    
endmodule

