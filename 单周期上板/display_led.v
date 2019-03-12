`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/27 09:26:20
// Design Name: 
// Module Name: display_led
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


module display_led(SW,sum,nco,co,cosu,data,syscall, pc);
   input[2:0]SW;
   output reg sum,nco,co,cosu,data,syscall,pc;
   initial begin  //≥ı ºªØ
      sum=0;nco=0;co=0;cosu=0;data=0;syscall=0;pc=0;
   end
   always@(SW) begin
     case(SW)
         3'b000: begin sum=1;nco=0;co=0;cosu=0;pc=0;data=0;syscall=0; end
         3'b001: begin sum=0;nco=1;co=0;cosu=0;pc=0;data=0;syscall=0; end
         3'b010: begin sum=0;nco=0;co=1;cosu=0;pc=0;data=0;syscall=0; end
         3'b011: begin sum=0;nco=0;co=0;cosu=1;pc=0;data=0;syscall=0; end
         3'b100: begin sum=0;nco=0;co=0;cosu=0;pc=0;data=1;syscall=0; end 
         3'b111: begin sum=0;nco=0;co=0;cosu=0;pc=0;data=0;syscall=1; end
         3'b101: begin sum=0;nco=0;co=0;cosu=0;pc=1;data=0;syscall=0; end
         default:begin sum=0;nco=0;co=0;cosu=0;data=0;pc=0;syscall=0;end
      endcase   
      end  
endmodule
