`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2023 02:28:13 PM
// Design Name: 
// Module Name: dataMemory
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


module dataMemory( //data memory module
    input readWrite, //0 for read, 1 for write
    
    input [31:0] address, //address of location
    input [31:0] data_in, //data input
    
    output reg [31:0] data_out //data output
    );
    
    reg [31:0] mem [31:0]; //memory register
    
    initial begin
    mem[0] = 32'h5f8511bd; //test instructions
    mem[1] = 32'hc3dc7d6c;
    mem[2] = 32'h2cf7245d;
    end
    
    always @(*) begin
    if (readWrite == 0) begin //read
        data_out = mem[address[4:0]]; end //load data from memory
    else if (readWrite == 1) begin //write
        mem[address[4:0]] = data_in; end //store data into memory
    end
          
endmodule
