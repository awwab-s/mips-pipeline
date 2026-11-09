`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 09:28:04 AM
// Design Name: 
// Module Name: sign_extender
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


module sign_extend( //sign extender module
    input [15:0] data_in,
    output reg [31:0] data_out
    );

always @(*) begin
    if (data_in[15] == 1) begin
        data_out = {{16{1'b1}}, data_in}; //pad 1, exted to 32bit
    end
    else begin
        data_out = {{16{1'b0}}, data_in}; //pad 0, extend to 32bit
    end
end

endmodule
