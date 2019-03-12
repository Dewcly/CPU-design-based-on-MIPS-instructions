module NPC( MBdz,PCout,Ljskz,Branch,Jump,JR,RA,DuanDian,PCNew,PCNow );
    input[25:0] MBdz;
    input[31:0] PCout ,Ljskz ,RA ;
    input Branch , Jump ,JR;
    output  [31:0] DuanDian ,PCNew ;
    output  [9:0] PCNow;
    
     wire [31:0] z1, z2;
     
     assign DuanDian = PCout + 4;
     assign PCNow = PCout[11:2];
     assign z1=(Branch == 1)?((Ljskz << 2) + PCout + 4) : (PCout + 4);
     assign z2=(Jump == 1)?({DuanDian[31:28],MBdz[25:0]} << 2):z1;
     assign PCNew=(JR==1)?RA:z2;
     
 endmodule
