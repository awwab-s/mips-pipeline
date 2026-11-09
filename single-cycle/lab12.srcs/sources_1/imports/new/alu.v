`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 09:37:19 AM
// Design Name: 
// Module Name: ALU
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


module alu( //alu module
    input [3:0] alu_op, //op selest
    input [31:0] op_a, //2 operands
    input [31:0] op_b,
    
    output reg [31:0] result, //alu result
    output reg zero_flag //zero flag
    );

always @(*) begin
    case (alu_op)
        4'b0000: result = op_a + op_b; //addition
        4'b0001: result = op_a - op_b; //subtraction
        4'b0010: result = op_a * op_b; //multiplication
        4'b0011: result = op_a / op_b; //division
        4'b0100: result = op_a & op_b; //AND
        4'b0101: result = op_a | op_b; //OR
        4'b0110: result = op_a ^ op_b; //XOR
        4'b0111: result = ~op_a; //NOT operand a
        4'b1000: result = ~op_b; //NOT operand b
        4'b1001: result = op_a << op_b; //shift left
        4'b1010: result = op_a >> op_b; //shift right
        4'b1011: result = {op_a[31], op_a[30:0]}; //rotate left
        4'b1100: result = {op_a[29:0], op_a[31:30]}; //rotate right
        4'b1101: result = op_a + 1; //increment operand a
        4'b1110: result = op_a - 1; //decrement operand a
        4'b1111: result = op_a; //no op
        default: result = 0; //default
    endcase
    
    if (!result) begin //check zero
        zero_flag = 1; end
    else begin
        zero_flag = 0; end
end

endmodule
