`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 09:04:03 AM
// Design Name: 
// Module Name: mips_pipeline
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


module mips_pipeline( //multicycled module
    input clk,
    input reset,
    input [31:0] instruction_start,
    
    output reg [31:0] reg_out
    );
    
    //pipeline registers
    reg [31:0] if_id_reg;
    reg [31:0] id_ex_reg;
    reg [31:0] ex_mem_reg;
    reg [31:0] mem_wb_reg;
    
    //control signals
    wire RegDst, RegWrite, ALUSrc, BEQ, MemWrite, MemToReg, JMP;
    wire [3:0] ALUop;
    
    //hazard detection signals
    wire ex_mem_hazard, mem_wb_hazard;
    
    //forwarding unit
    wire ex_fwd_a, ex_fwd_b;
    
    //stall signal
    reg stall;
    
    // Instruction Fetch (IF) stage
    always @(posedge clk) begin
        if (reset) begin
            if_id_reg <= 32'h0;
        end else begin
            if_id_reg <= instruction_start;
            //call IF module
        end
    end
    
    // Instruction Decode (ID) stage
    always @(posedge clk) begin
        if (reset) begin
            id_ex_reg <= 32'h0;
        end else if (stall) begin
            id_ex_reg <= id_ex_reg;
        end else begin
            id_ex_reg <= if_id_reg;
            //call ID module
        end
    end
    
    // Execute (EX) stage
    always @(posedge clk) begin
        if (reset) begin
            ex_mem_reg <= 32'h0;
        end else if (stall) begin
            ex_mem_reg <= ex_mem_reg;
        end else begin
            ex_mem_reg <= id_ex_reg;
            //call EX module
        end
    end
    
    // Memory (MEM) stage
    always @(posedge clk) begin
        if (reset) begin
            mem_wb_reg <= 32'h0;
        end else if (stall) begin
            mem_wb_reg <= mem_wb_reg;
        end else begin
            mem_wb_reg <= ex_mem_reg;
            //call MEM module
        end
    end
    
    // Write Back (WB) stage
    always @(posedge clk) begin
        if (reset) begin
            reg_out <= 32'h0;
        end else if (stall) begin
            reg_out <= reg_out;
        end else begin
            reg_out <= mem_wb_reg;
            //call WB module
        end
    end
    
    //hazard detection unit
    assign ex_mem_hazard = (ex_mem_reg[20:16] == id_ex_reg[25:21]) && (ex_mem_reg[20:16] != 0) && (ex_mem_reg[4:2] != 3'b000);
    assign mem_wb_hazard = (mem_wb_reg[20:16] == id_ex_reg[25:21]) && (mem_wb_reg[20:16] != 0) && (mem_wb_reg[4:2] != 3'b000);

    //stall logic
    always @(posedge clk) begin
        if (reset) begin
            stall <= 0;
        end else begin
            stall <= (ex_mem_hazard || mem_wb_hazard) ? 1 : 0;
        end
    end
    
    //forward unit
    assign ex_fwd_a = (ex_mem_reg[20:16] == id_ex_reg[25:21]) ? ex_mem_reg[31:0] : 0;
    assign ex_fwd_b = (ex_mem_reg[20:16] == id_ex_reg[20:16]) ? ex_mem_reg[31:0] : 0;
endmodule
