`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 11:22:30
// Design Name: 
// Module Name: extend
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


module extend(
    input YW,
    input [15:0] Ljs,
    input [4:0] shamt,
    output [31:0] Ljskz
);
    wire [31:0] ljskz;
    wire [31:0] shamtkz;
    assign ljskz[15:0] = Ljs;
    assign ljskz[31:16] = Ljs[15]? 16'hffff : 16'h0000;
    assign shamtkz[4:0] = shamt;
    assign shamtkz[31:5] = shamt[4]? 27'h7ffffff : 27'h0000000;
    assign Ljskz[31:0] = YW? shamtkz[31:0] : ljskz[31:0];
endmodule
