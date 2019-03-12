`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 14:01:06
// Design Name: 
// Module Name: select_5
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


module select_5(
input [4:0]a,
input [4:0]b,
input sel,
output [4:0]out1
    );
        assign out1=sel?b:a;
endmodule
