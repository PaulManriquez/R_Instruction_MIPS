module PC(
  input 	wire 	clk,rst,
  input 	wire  [31:0]PC_in,
  output 	wire  [31:0]PC_out	

);
  
  reg [31:0]dataReg;
  
  initial begin 
  dataReg<=0;
  end
  
  always@(posedge clk or negedge rst)begin 
    if(!rst)begin 
    dataReg<=0;
    end else //Here a missed the else statement 
    
    dataReg<=PC_in;
    
  end
  
  assign PC_out=dataReg;
  
  
endmodule

//Initial blocks: https://www.chipverify.com/verilog/verilog-initial-block