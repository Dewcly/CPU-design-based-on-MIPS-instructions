`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 10:11:50
// Design Name: 
// Module Name: top_file
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


module top_file(
input clkN,    //时钟频率
input rst,     // 清零信号
input [3:0] dmData,
input [2:0] switch, //选择显示的输出
input turn,  //切换频率
output [7:0] SEG,AN,  //数码管
output  s1,s2,s3,s4,s5,s6,s7  //显示灯
);
    wire[25:0] MBdz;
    wire[31:0] PCout ,Ljskz ;
    wire Branch , Jump ,JR;
    wire [31:0] DuanDian ,PCNew ;
    wire [9:0] PCNow;
    wire halt;
    wire [31:0] pc;
    
   //decoder
    wire [5:0] OP;
    wire [4:0] rs;
    wire  [4:0] rt;
    wire  [4:0] rd;
    wire  [4:0] shamt;
    wire  [5:0] funct;
    wire  [15:0] Ljs;
//    wire  [25:0] MBdz;
 
     //control
     wire equal;
     wire NCtoREG,YWorNOBranch,Store,JAL,OPR,Load,RW,YW,Branches, dispsrc,disp;
     wire [3:0] alu_op;
     
    //extend(fhkz)
    
    //statistics
    wire [31:0] sum;   //总周期数
    wire [31:0] nco;    //无条件跳转数
    wire [31:0] co;    //有条件跳转数
    wire [31:0] cosu;   //有条件跳转成功数
    
    //display_ch
    wire [31:0] syscall;
    wire  [31:0] outout;
    
    //ALU
    wire [31:0]  y;
    wire of, cf;
    wire [31:0] R, R2;
    
    //RF
    wire [4:0] rw, ra, rb;
    wire [31:0] writeData;
    wire [31:0] A, B;
    
    //DM
    wire [31:0] NCout;
    
    //diver
   // wire clkN;
    
    //select
    wire [31:0] z1 ,dmout;
    wire [4:0] z2,z3;
    //register
//    divider #(10_000) div(clk, clkN);
    NPC NPC_1( MBdz,PCout,Ljskz,Branch,Jump,JR,A,DuanDian,PCNew,PCNow );
    PC PC_1(clkN,rst,halt,PCNew,PCout );
    IM IM_1(PCNow,pc);
    decoder decoder_1(pc,OP,rs,rt,rd,shamt,funct,Ljs,MBdz);
    control control_1(OP,funct,equal,B,Jump,NCtoREG,YWorNOBranch,Branch,Store,JAL,OPR,JR,Load,RW,YW,Branches,alu_op,dispsrc,disp,halt);
    extend extend_1( YW, Ljs,shamt,Ljskz);
    statistics statistics_1(clkN,rst,halt,Jump,JR,Branches,Branch,sum,nco,co,cosu);
    display_ch display_ch_1(sum,nco,co,cosu,pc,syscall,dmout,switch,outout);
    alu alu_1(A, y, alu_op, of, cf, equal, R, R2);
    regFile regFile_1(clkN, ~RW, rw, ra, rb, writeData, A, B);
    dm dm_1(R,B,Store,clkN,Load,rst,NCout, dmData, dmout);
    register register_1(A,disp,clkN,rst,syscall);
    display display_1(clk,outout,SEG,AN);
    display_led display_led_1(switch,s1,s2,s3,s4,s5,s6,s7);
    select_32 m1(R,NCout,NCtoREG,z1);
    select_32 m2(z1,DuanDian,JAL,writeData);
    select_5 m3(rt,rd,OPR,z2);
    select_5 m4(z2,5'b11111,JAL,rw);
    select_5 m5(rs,rt,YW,z3);
    select_5 m6(z3,5'b00100,disp,ra);
    select_5 m7(rt,5'b00010,dispsrc,rb);
    select_32 m8(B,Ljskz,YWorNOBranch,y);
    divider #(2) divider_1(clk,clk1);
    divider #(4000000) div2(clk, clk2);
    //select_32 mux(clk, clk2, turn, clkN);
endmodule
