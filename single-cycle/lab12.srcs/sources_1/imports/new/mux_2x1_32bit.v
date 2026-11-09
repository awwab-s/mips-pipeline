`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 09:22:35 AM
// Design Name: 
// Module Name: mux_2x1
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


module mux_2x1_32bit( //mux module
    input sel, //selection
    input [31:0] data_in1, //data inputs
    input [31:0] data_in2,
    output reg [31:0] data_out //data output
    );

    always @(*) begin
    case (sel) //select data
    1'b0: data_out = data_in1;
    1'b1: data_out = data_in2;
    endcase
    end

endmodule
