`timescale 1ns/1ps

module R_Instruction_TB;
  
  reg clk_TB,rst_TB;
  integer i;
  
  R_Instruction DUT(
    .clk(clk_TB),
    .rst(rst_TB)
  );
  
  
  initial begin 
    //clk and reset begin
  clk_TB=1'b0; rst_TB=1'b0; #2;
  rst_TB=1'b1;
    for(i=0;i<5;i++)begin
    #2;
    $display("Instruction:%b",DUT.Inst);
    $display("RS_Data:%b\tRT_Data:%b",DUT.RS_Data,DUT.RT_Data);
    case(DUT.Inst[5:0])
      32: $display("ADD");
      34: $display("SUB");
      36: $display("AND");
      37: $display("OR");
      42: $display("SLT");
      default : $display("ERROR");
      endcase 
    $display("Ans_ALU:%b\tZero:%b",DUT.Ans_ALU,DUT.zero);
      $display("OutRam:%b\n",DUT.Out_RAM);
    end
    
    $finish;
  end
  
  always #1 clk_TB=~clk_TB;
  
endmodule
  
