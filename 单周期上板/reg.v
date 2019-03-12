`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 20:55:57
// Design Name: 
// Module Name: reg
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


module register(
    input [31:0] datain,
    input en,
    input clk,
    input clr,
    output reg [31:0] dataout
    );
    reg [31:0] temp;
    initial begin
        temp <= 0;
    end
//    assign dataout = temp;
    always @(posedge clk) begin
        dataout = temp;
        if(clr ==  1) temp = 0;
        else if(en == 0) temp = temp;
        else if(en==1&&clr==0) temp = datain;
    end
endmodule
