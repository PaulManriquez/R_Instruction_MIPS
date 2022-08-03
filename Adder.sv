module Adder(
 
  input 	wire 	[31:0]A,B,
  output 		[31:0]Y
 
);
  
  assign Y=A+B;
  
endmodule