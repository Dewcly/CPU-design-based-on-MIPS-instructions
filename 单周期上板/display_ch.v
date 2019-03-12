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
input [31:0] sum,   //��������
input [31:0] nco,    //��������ת��
input [31:0] co,     //��������ת��
input [31:0] cosu,   //��������ת�ɹ���
input [31:0] pc,   //ָ��
input [31:0] syscall,
input [31:0] data,
input [2:0] switch, //ѡ����ʾ�����
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
