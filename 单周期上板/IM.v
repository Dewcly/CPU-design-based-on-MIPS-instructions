`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/26 14:53:51
// Design Name: 
// Module Name: IM
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


module IM(PCNow,PC);
    
    input  [9:0]PCNow;
    output reg [31:0] PC;
    reg [31:0] mem[0:1023];
    initial begin
        $readmemh("F:/benchmark.hex", mem); // 从文件中读取指令二进制代码赋值给mem
        //$readmemh("F:/yw.hex", mem);
        PC = 0; // 指令初始化
    end

    always @(*) begin
       PC = mem[PCNow]; 
    end

endmodule
