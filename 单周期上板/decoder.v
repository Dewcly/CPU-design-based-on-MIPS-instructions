`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 14:53:16
// Design Name: 
// Module Name: decoder
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


module decoder(PC,OP,rs,rt,rd,shamt,funct,Ljs,MBdz);
    
    input [31:0] PC;
    output reg [5:0] OP;
    output reg [4:0] rs;
    output reg [4:0] rt;
    output reg [4:0] rd;
    output reg [4:0] shamt;
    output reg [5:0] funct;
    output reg [15:0] Ljs;
    output reg [25:0] MBdz;
    
    initial begin
        OP=0;
        rs=0;
        rt=0;
        rd=0;
        shamt=0;
        funct=0;
        Ljs=0;
        MBdz=0;
        end
    
    
    always @(PC)begin
        OP = PC[31:26];
        rs = PC[25:21];
        rt = PC[20:16];
        rd = PC[15:11];
        shamt = PC[10:6];
        funct = PC[5:0];
        Ljs = PC[15:0];
        MBdz = PC[25:0];
        end
   endmodule
