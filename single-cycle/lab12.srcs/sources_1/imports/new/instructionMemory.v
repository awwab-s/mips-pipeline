`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 10:02:24 AM
// Design Name: 
// Module Name: instruction_memory
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


module instructionMemory( //instruction memory module
    input [31:0] address, //address of location
    output reg [31:0] data_out //data output
    );
    
    reg [31:0] mem [31:0]; //memory register
    
    initial begin
    mem[0] = 32'h1d31ec35; //instructions
    mem[1] = 32'h63daf90b;
    mem[2] = 32'hdecfca53;
    mem[3] = 32'ha6704bc5;
    mem[4] = 32'h2ba92e87;
    mem[5] = 32'hc09a8e1c;
    mem[6] = 32'h0068fc20;
    mem[7] = 32'h38a022da;
    end
    
    //0000 00,00 011,0 1000, 1111 1,100 00,10 0000
    
    always @(*) begin
    data_out = mem[address[4:0]]; //load instruction from memory to output
    end
    
endmodule
