`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2023 04:40:55 PM
// Design Name: 
// Module Name: concat
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


module concat( //concatenation module
    input [27:0] data_in1,
    input [3:0] data_in2,
    output reg [31:0] data_concat
    );
    
    always @(*) begin
    data_concat = {data_in2, data_in1}; //concatenate 28bit and 4bit to 32bit
    end
    
endmodule
