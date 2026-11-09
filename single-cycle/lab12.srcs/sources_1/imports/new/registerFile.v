`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2023 02:53:14 PM
// Design Name: 
// Module Name: registerFile
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


module registerFile( //register file module
    input write,
    input [4:0] rd_addr1, //read addresses
    input [4:0] rd_addr2,
    input [4:0] wr_addr, //write address
    input [31:0] wr_data, //write data
    
    output reg [31:0] rd_data1, //read data
    output reg [31:0] rd_data2
);

    reg [31:0] mem [31:0];
    
    initial begin
    mem[3] = 32'h00000009; //test register values
    mem[8] = 32'h0000000c;
    mem[31] = 32'h0;
    end

    always @(*) begin
    if (write) begin //write pin = 1
        mem[wr_addr] = wr_data; end //write data to register file
        
    rd_data1 = mem[rd_addr1]; //load read data from register memory
    rd_data2 = mem[rd_addr2];
    end

endmodule
