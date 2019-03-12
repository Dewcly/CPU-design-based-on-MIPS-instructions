`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 09:48:59
// Design Name: 
// Module Name: control
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


module control(op,funct,equal,RB,jump,NCtoREG,YWorNOBranch,Branch,Store,JAL,OPR,JR,Load,RW,YW,Branches,alu_op,dispsrc,disp,halt);
 input [5:0] op;
 input [5:0] funct;
 input equal;
 input [31:0] RB;
 output  jump,NCtoREG,YWorNOBranch,Branch,Store,JAL,OPR,JR,Load,RW,YW,Branches, dispsrc,disp,halt;
 output [3:0] alu_op;
   assign OPR=(op==0)?1:0;
   assign jump=(op==6'b000010||op==6'b000011)?1:0;
   assign JAL=(op==6'b000011)?1:0;
   assign NCtoREG=(op[4:0]==5'b00011)?1:0;
   assign Load=(op==6'b100011)?1:0;
   assign Branches=(op[4:0]==5'b00100||op[4:0]==5'b00101)?1:0;
   assign Store=(op==6'b101011)?1:0;
   assign Branch=((equal&&(op[4:0]==5'b00100))||(~equal&&op[4:0]==5'b00101))?1:0;
   assign YW=(OPR&&(~funct[5:5])&&((funct[4:0]==5'b00000)||(funct[4:0]==5'b00010)||(funct[4:0]==5'b00011)))?1:0;
   assign YWorNOBranch=(~(Branches||OPR)||YW);
   assign RW=(Store||(op[4:0]==5'b00010)||Branches||(OPR&&(funct[4:0]==5'b01100)))?1:0;
   assign JR=(OPR&&(~funct[5:5])&&(funct[4:0]==5'b01000))?1:0;
   assign dispsrc=(OPR&&(funct[4:0]==5'b01100))?1:0;
   assign halt=(dispsrc&&(RB==10))?1:0;
   assign disp=(dispsrc&&(RB!=10))?1:0;
  
   assign alu_op=(OPR&&(funct==6'b100000))?4'b0101:
                 (op==6'b010000)?4'b0101:
                 (op==6'b010001)?4'b0101:
                 (OPR&&(funct==6'b100001))?4'b0101:
                 (OPR&&(funct==6'b100100))?4'b0111:
                 (op==6'b001100)?4'b0111:
                 (OPR&&(funct==6'b000000))?4'b0000:
                 (OPR&&(funct==6'b000011))?4'b0001:
                 (OPR&&(funct==6'b000010))?4'b0010:
                 (OPR&&(funct==6'b100010))?4'b0110:
                 (OPR&&(funct==6'b100101))?4'b1000:
                 (op==6'b001101)?4'b1000:
                 (OPR&&(funct==6'b100111))?4'b1010:
                 (op==6'b100011)?4'b0101:
                 (op==6'b101011)?4'b0101:
                 (OPR&&(funct==6'b101010))?4'b1011:
                 (op==6'b001010)?4'b1011:
                 (OPR&&(funct==6'b101011))?4'b1100:
                 (op==6'b000011)?4'b0101:4'b0101;//当不在上述情况时用0101作为default情况
endmodule
