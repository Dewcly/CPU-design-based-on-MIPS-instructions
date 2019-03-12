`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 14:15:45
// Design Name: 
// Module Name: PC
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


module PC(clk,Reset,halt,PCNew,PCout );
    input clk,Reset,halt;
    input [31:0] PCNew;
    output reg [31:0] PCout;
    
    initial begin
        PCout = 0;
        end
       always @(posedge clk )begin
           if (Reset == 1) begin  
               PCout = 0;  
           end  
           else if (halt == 1)begin
           PCout =PCout;
        end
        else 
        PCout=PCNew;
        end
 endmodule
