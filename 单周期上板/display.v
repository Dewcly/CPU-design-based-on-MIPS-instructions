`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 14:07:46
// Design Name: 
// Module Name: display
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

module display(clk,SyscallOut,SEG,AN);
   input [31:0]SyscallOut; //32位寄存器
   input clk;
   output reg[7:0] SEG,AN;
   reg[7:0]rom[15:0];
   reg[7:0]an[7:0];
   reg[2:0] counter; //循环计数
    

   initial begin        
   counter = 0;             //初始化变量
   rom[0] = 8'b11000000;     //8段显示码
   rom[1] = 8'b11111001;
   rom[2] = 8'b10100100;
   rom[3] = 8'b10110000;
   rom[4] = 8'b10011001;
   rom[5] = 8'b10010010;
   rom[6] = 8'b10000010;
   rom[7] = 8'b11111000;
   rom[8] = 8'b10000000;
   rom[9] = 8'b10010000;
   rom[10] = 8'b10001000;
   rom[11] = 8'b10000011;
   rom[12] = 8'b11000110;
   rom[13] = 8'b10100001;
   rom[14] = 8'b10000110;
   rom[15] = 8'b10001110;
   
   an[7] = 8'b01111111;      //根据索引找到需要亮的AN管
   an[6] = 8'b10111111;
   an[5] = 8'b11011111;
   an[4] = 8'b11101111;
   an[3] = 8'b11110111;
   an[2] = 8'b11111011;
   an[1] = 8'b11111101;
   an[0] = 8'b11111110;
   SEG = 8'b11000000;
   AN=8'b00000000;
   end
   
   divider #(10_000) div(clk, ck); 
   always @(posedge ck) begin
       AN = an[counter];
       counter <= counter + 1;
       case(counter)
        0:SEG = rom[SyscallOut[3:0]];
        1:SEG = rom[SyscallOut[7:4]];
        2:SEG = rom[SyscallOut[11:8]];
        3:SEG = rom[SyscallOut[15:12]];
        4:SEG = rom[SyscallOut[19:16]];
        5:SEG = rom[SyscallOut[23:20]];
        6:SEG = rom[SyscallOut[27:24]];
        7:SEG = rom[SyscallOut[31:28]];  
      endcase
    end
endmodule
