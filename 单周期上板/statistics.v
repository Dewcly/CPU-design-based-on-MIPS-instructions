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
input clk,   //ʱ������
input rst,   //�����ź�
input halt,  //ͣ���ź�
input jump,  //��תָ��
input jr,    //��ת�Ĵ���
input branches,//��������ת�ź�
input branch,//��������ת�ɹ��ź�
output reg[31:0] sum,   //��������
output reg[31:0] nco,    //��������ת��
output reg[31:0] co,     //��������ת��
output reg[31:0] cosu   //��������ת�ɹ���
    );
    reg[31:0] num;   //���ڼ���
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
