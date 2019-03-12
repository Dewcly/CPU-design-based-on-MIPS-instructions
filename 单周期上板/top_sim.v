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
reg clk;    //ʱ��Ƶ��
reg rst;     // �����ź�
reg [2:0] switch; //ѡ����ʾ�����
reg [3:0] dmData;
reg turn;  //�л�Ƶ��
wire [7:0] SEG,AN;  //�����
wire  s1,s2,s3,s4,s5,s6 ; //��ʾ��

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
