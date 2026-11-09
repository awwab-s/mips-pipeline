`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2023 12:22:42 AM
// Design Name: 
// Module Name: control_unit
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


module control_unit( //control module
    input clk,
    input reset,
    input [5:0] opcode, funct, //opcode, funct input
    output reg RegDst, RegWrite, ALUSrc, MemWrite, MemToReg, BEQ, Jump, //pins output
    output reg[3:0] ALUOp //alu-op pins
    );
   
   
    always @(*) begin
    case(opcode)
   
    //r type
    6'b000000: begin
        RegDst = 1;
        RegWrite = 1;
        ALUSrc = 0;
        MemWrite = 0;
        MemToReg = 0;
        BEQ = 0;
        Jump = 0;
       
        case(funct)
        6'b100100: ALUOp = 4'b0000; //and
        6'b100101: ALUOp = 4'b0001; //or
        6'b100000: ALUOp = 4'b0010; //add
        6'b100010: ALUOp = 4'b0110; //sub
        endcase
        end
    
    //load word
    6'b100011: begin
        RegDst = 0;
        RegWrite = 1;
        ALUSrc = 1;
        MemWrite = 0;
        MemToReg = 1;
        BEQ = 0;
        Jump = 0;
        ALUOp = 4'b0010; //add
        end
    
    //store word
    6'b101011: begin
        RegDst = 1'bx;
        RegWrite = 0;
        ALUSrc = 1;
        MemWrite = 1;
        MemToReg = 1'bx;
        BEQ = 0;
        Jump = 0;
        ALUOp = 4'b0010; //add
        end
    
    //branch if equal
    6'b000100: begin
        RegDst = 1'bx;
        RegWrite = 0;
        ALUSrc = 0;
        MemWrite = 0;
        MemToReg = 1'bx;
        BEQ = 1;
        Jump = 0;
        ALUOp = 4'b0110; //sub
        end
    
    //jump
    6'b000010: begin
        RegDst = 1'bx;
        RegWrite = 0;
        ALUSrc = 1'bx;
        MemWrite = 0;
        MemToReg = 1'bx;
        BEQ = 1'bx;
        Jump = 1;
        ALUOp = 4'bxxxx; //no-op
        end
    endcase
    end
   
endmodule
