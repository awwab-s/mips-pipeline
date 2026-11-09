`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 09:02:44 AM
// Design Name: 
// Module Name: forward_unit
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


module forwarding_unit(
  input [1:0] EX_MEM_RegWrite,
  input [1:0] MEM_WB_RegWrite,
  input [4:0] EX_MEM_Rd,
  input [4:0] MEM_WB_Rd,
  input [4:0] ID_EX_Rs,
  input [4:0] ID_EX_Rt,
  output reg [1:0] forwardA,
  output reg [1:0] forwardB
);

  always @(*) begin
    // Initialize forwarding signals to default values
    forwardA = 2'b00;
    forwardB = 2'b00;

    // Check for data hazards and set forwarding signals accordingly
    if (EX_MEM_RegWrite[1] && EX_MEM_Rd[1] && (EX_MEM_Rd[1] != 5'b00000) && (EX_MEM_Rd[1] == ID_EX_Rs[1]))
      forwardA = 2'b10; // Forward data from EX/MEM pipeline stage to ALU operand A

    if (EX_MEM_RegWrite[1] && EX_MEM_Rd[1] && (EX_MEM_Rd[1] != 5'b00000) && (EX_MEM_Rd[1] == ID_EX_Rt[1]))
      forwardB = 2'b10; // Forward data from EX/MEM pipeline stage to ALU operand B

    if (MEM_WB_RegWrite[1] && MEM_WB_Rd[1] && (MEM_WB_Rd[1] != 5'b00000)) begin
      if ((forwardA == 2'b00) && (MEM_WB_Rd[1] == ID_EX_Rs[1]))
        forwardA = 2'b01; // Forward data from MEM/WB pipeline stage to ALU operand A
      if ((forwardB == 2'b00) && (MEM_WB_Rd[1] == ID_EX_Rt[1]))
        forwardB = 2'b01; // Forward data from MEM/WB pipeline stage to ALU operand B
    end
  end

endmodule
