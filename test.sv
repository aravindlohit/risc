module test ();
  reg clk1;
  reg clk2;
  int k;
  risc dut(clk1,clk2);
  initial begin
    clk1=0;clk2=0;
    repeat(20)
      begin
      #5clk1=1; #5 clk1=0;
    #5 clk2=1;
    #5 clk2=0;
      end
  end
  initial 
    begin
      for(k=0;k<31;k++);
      dut.Reg[k]=k;
      //simple add program , more programs will be added in the future//
      dut.Mem[0]= 32'h2801000a;
      dut.Mem[1]= 32'h28020014;
      dut.Mem[2]= 32'h28030019;
      dut.Mem[3]= 32'h0ce77800;
      dut.Mem[4]= 32'h0ce77800;
      dut.Mem[5]= 32'h00222000;
      dut.Mem[6]= 32'h0ce77800;
      dut.Mem[7]= 32'h00832800;
      dut.Mem[8]= 32'hfc000000;
      dut.HALTED=0;
      dut.PC=0;
      dut.TAKEN_BRANCH=0;
      #280
      for(k=0;k<6;k++)
        $display("R%1d - %2d",k,dut.Reg[k]);
    end
   initial
   begin
     $dumpfile("dump.vcd");
     $dumpvars(0, test.dut);
    #600 $finish;
   end
endmodule
      
      
