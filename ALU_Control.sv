module ALU_Control(
  input  [5:0]instruction,
  output reg [2:0]ctrl_out 
);
  
  always @(instruction)
     begin 
      case (instruction) 
        6'b100000: ctrl_out <= 3'b000;    //MIPS OP ADD
        6'b100010: ctrl_out <= 3'b001;    //MIPS OP SUB
        6'b100100: ctrl_out <= 3'b010;    //MIPS OP AND
        6'b100101: ctrl_out <= 3'b011;    //MIPS OP OR
        6'b101010: ctrl_out <= 3'b100;    //MIPS OP SLT
       
      endcase
    end 
  
 
endmodule