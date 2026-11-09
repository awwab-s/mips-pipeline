`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 02:06:31 AM
// Design Name: 
// Module Name: adder
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


module adder( //adder module
    input [31:0] data_in1, data_in2, //2 inputs
    output reg [31:0] data_out //output
    );
    
    always @(*) begin
    data_out = data_in1 + data_in2; //add inputs
    end
    
endmodule
