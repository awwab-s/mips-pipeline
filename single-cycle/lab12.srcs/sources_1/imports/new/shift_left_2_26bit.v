`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 04:44:42 AM
// Design Name: 
// Module Name: shift_left_2_26bit
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


module shift_left_2_26bit( //shift module
    input [25:0] data_in,
    output reg [27:0] data_shift
    );
    
    always @(*) begin
    data_shift = data_in << 2; //shift left by 2
    end
    
endmodule
