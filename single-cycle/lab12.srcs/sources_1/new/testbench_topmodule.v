`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 03:40:25 AM
// Design Name: 
// Module Name: testbench_topmodule
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


module testbench_topmodule();

reg clk;
reg reset;

top_module t1(clk, reset);

always begin
#5 clk = ~clk;
end

initial begin
clk = 0;
reset = 1;

reset = 0;
end

endmodule
