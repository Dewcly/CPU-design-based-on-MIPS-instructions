`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 14:22:37
// Design Name: 
// Module Name: dataMemory
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


module dm(addr, datain, str, clk, ld, clr, dataout, dmData, dmout);
    input [31:0] addr;
    input [31:0] datain;
    input str,clk,ld, clr;
    input [3:0] dmData;
    output  [31:0] dataout, dmout;
    
    reg [31:0] memory[0:1023];
    integer i;
    wire [9:0] address;
    assign address = addr[11:2];
    assign dmout = memory[dmData];
    initial begin
        for(i = 0; i < 1024; i = i + 1) begin
            memory[i] = 0;
        end
    end 
    //read
    assign   dataout = memory[address];
 
    //write
    always @(posedge clk) begin
        if(str == 1 && clr == 0) 
             memory[address] = datain;
    end 
    //clr
//    always @(posedge clr) begin
//        for(i = 0; i < 128; i = i + 1) begin
//            memory[i] = 0;
//        end
//    end
endmodule
