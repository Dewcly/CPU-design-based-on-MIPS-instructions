`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 10:37:14
// Design Name: 
// Module Name: statistics
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


module statistics(
input clk,   //时钟脉冲
input rst,   //清零信号
input halt,  //停机信号
input jump,  //跳转指令
input jr,    //跳转寄存器
input branches,//有条件跳转信号
input branch,//有条件跳转成功信号
output reg[31:0] sum,   //总周期数
output reg[31:0] nco,    //无条件跳转数
output reg[31:0] co,     //有条件跳转数
output reg[31:0] cosu   //有条件跳转成功数
    );
    reg[31:0] num;   //用于计数
    initial begin sum=0;num=0;nco=0;co=0;cosu=0; end
    always@(posedge clk)
    begin
    if(rst==1)
    begin
    sum<=0;
    num<=0;
    nco<=0;
    co<=0;
    cosu<=0;
    end
    if(jr==1||jump==1)
    begin  
    nco=nco+1;
    end
    if(branch==1)
    cosu=cosu+1;
    if(branches==1)
    co=co+1;
    if(halt==0&&num==sum)
    begin
    sum=sum+1;
    num=num+1;
    end
    if(halt==1&&sum==num)
    begin
    sum=sum+1;
    num=num;
    end
    if(halt==1&&sum!=num)
    begin
    sum=sum;
    num=num;
    end 
    end
endmodule
