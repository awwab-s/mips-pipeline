`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 09:49:56 AM
// Design Name: 
// Module Name: PC
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


module pc( //program counter module
    input reset,
    input [31:0] pc_in, //next instruction address input
    output reg [31:0] pc_out //instruction address output
    );
    reg [31:0] pc; //pc memory
    
    initial begin //initialize memory
    pc = 32'b0;
    end
    
    always @(*) begin
    if (!reset) begin
        pc = 32'b0; pc_out = 32'b0; end //clear pc
    else begin
        pc = pc_in; pc_out = pc; end //load next pc instruction
    end
    
endmodule
