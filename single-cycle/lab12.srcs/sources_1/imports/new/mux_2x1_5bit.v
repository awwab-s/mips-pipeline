`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2023 11:12:48 PM
// Design Name: 
// Module Name: mux_2x1_5bit
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


module mux_2x1_5bit( //mux module
    input sel, //selection
    input [4:0] data_in1, //data inputs
    input [4:0] data_in2,
    output reg [4:0] data_out //data output
    );

    always @(*) begin
    case (sel) //select data
    1'b0: data_out = data_in1;
    1'b1: data_out = data_in2;
    endcase
    end

endmodule