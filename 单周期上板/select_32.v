`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 14:07:13
// Design Name: 
// Module Name: select_32
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


module select_32(
input [31:0]a,
input [31:0]b,
input sel,
output [31:0]out1
    );
        assign out1=sel?b:a;
endmodule
