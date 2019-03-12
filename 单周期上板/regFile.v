`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 16:17:32
// Design Name: 
// Module Name: regFile
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


module regFile(clk, WE, rw, ra, rb, writeData, A, B);
    input clk, WE;
    input [4:0] rw, ra, rb;
    input [31:0] writeData;
    output [31:0] A, B;
    
    reg [31:0] regMem[0:31];
    integer i;
    initial begin
        for(i = 0; i < 32; i = i + 1)
            regMem[i] = 0;
    end
    assign A = regMem[ra];
    assign B = regMem[rb];
    always @(posedge clk) begin
        if((rw != 0) && (WE == 1))  regMem[rw] = writeData;
    end
endmodule

