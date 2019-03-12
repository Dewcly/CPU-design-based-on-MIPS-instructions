`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 15:21:53
// Design Name: 
// Module Name: display_ch
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


module display_ch(
input [31:0] sum,   //总周期数
input [31:0] nco,    //无条件跳转数
input [31:0] co,     //有条件跳转数
input [31:0] cosu,   //有条件跳转成功数
input [31:0] pc,   //指令
input [31:0] syscall,
input [31:0] data,
input [2:0] switch, //选择显示的输出
output  [31:0] outout
    );
    assign outout=  (switch==3'b000)?sum:
                    (switch==3'b001)?nco:
                    (switch==3'b010)?co:
                    (switch==3'b011)?cosu:
                    (switch==3'b100)?data:
                    (switch==3'b101)?pc:
                    (switch==3'b111)?syscall:0;
                 
endmodule
