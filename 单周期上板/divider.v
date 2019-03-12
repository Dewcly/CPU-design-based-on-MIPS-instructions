`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/27 11:50:25
// Design Name: 
// Module Name: divider
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


//分频器
module divider #(parameter N = 100_000_000)(clk, clk_N);
    input clk; // 系统时钟
    output reg clk_N; // 分频后的时钟
    //reg [63:0] N = 4000; // 1Hz的时钟,N=fclk/fclk_N
    
    reg [31:0] counter; /* 计数器变量，通过计数实现分频。
                         当计数器从0计数到(N/2-1)时，
                         输出时钟翻转，计数器清零*/
                         
    
    initial begin clk_N <= 0; counter <= 0; end
    always @(posedge clk) begin  // 时钟上升沿
        counter = counter + 1; 
        if (counter >= (N / 2 - 1)) begin
            clk_N <= ~clk_N;
            counter <= 0;
        end
    end                    
endmodule
