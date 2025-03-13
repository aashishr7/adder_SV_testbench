// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"
//`include "test_2.sv"

module tb;
  
  bit clk, rst;
  
  //clock generation
  always #5 clk = ~clk;
  
  //reset Generation
  initial begin
    rst = 1;
    #5 rst =0;
  end
  
  intf i_intf(clk,rst);
  
  // Instantiate coverage
  initial begin
    i_intf.cg = new();  // Create the coverage instance
  end
  
  
  //DUT instance, interface signals are connected to the DUT ports
  adder DUT(
    .clk(i_intf.clk),
    .rst(i_intf.rst),
    .a(i_intf.a),
    .b(i_intf.b),
    .c(i_intf.c),
    .valid(i_intf.valid)
           );
  
   //Testcase instance, interface handle is passed to test as an argument
 
  test t1(i_intf);
  

  
  //enabling the wave dump
  initial begin 
    
    $dumpfile("dump.vcd"); 
    $dumpvars;
   
  end
endmodule
  
