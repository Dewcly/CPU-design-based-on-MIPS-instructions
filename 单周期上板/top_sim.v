`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 21:25:54
// Design Name: 
// Module Name: top_sim
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


module top_sim( );
reg clk;    //时钟频率
reg rst;     // 清零信号
reg [2:0] switch; //选择显示的输出
reg [3:0] dmData;
reg turn;  //切换频率
wire [7:0] SEG,AN;  //数码管
wire  s1,s2,s3,s4,s5,s6 ; //显示灯

initial begin
    dmData = 0;
  switch=3'b000;
  clk=0;
  rst=0;
  turn=0;
end
always begin 
  #1 clk = ~clk;
end
  top_file top_sim(clk,rst,dmData,switch,turn,SEG,AN,s1,s2,s3,s4,s5,s6); 
  
endmodule
