// R instruction datapath , MIPS architecture
//Programmer: Paul Manriquez
//Date: 26/07/2022
`include "Adder.sv"
`include "PC.sv"
`include "InstMem.sv"
`include "RegFile.sv"
`include "ALU_Control.sv"
`include "ALU.sv"
`include "DataMem.sv"

module R_Instruction(
input clk,rst
);
  wire [31:0]Test,Out_R,Out_PC,Inst;
  wire [31:0]Out_RAM,RS_Data,RT_Data;
  wire [2:0]Operation;//ALU operation
  
  wire [31:0]Ans_ALU;
  wire zero;
  
  wire [31:0]WD;//Sin conectar
  
  Adder 	U0(32'b1,Out_PC,Out_R);
  PC		U1(clk,rst,Out_R,Out_PC);
  InstMem	U2(Out_PC,Inst);
  
  RegFile	U3(
    clk,1'b0,Inst[15:11],/*RD*/Out_RAM,
    Inst[25:21]/*RS*/,RS_Data,
    Inst[20:16]/*RT*/,RT_Data
  );
  
  ALU_Control 	U4(Inst[5:0],Operation);
  ALU			U5(Operation,RS_Data,RT_Data,Ans_ALU,zero);
  DataMem		U6(clk,1'b0,Ans_ALU,WD,Out_RAM);
  
  
endmodule
