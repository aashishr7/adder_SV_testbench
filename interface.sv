interface intf(input logic clk, rst);
  
  logic valid;
  logic [3:0]a;
  logic [3:0]b;
  logic [6:0]c;
  
  // coverage
  covergroup cg_intf @(posedge clk);
    
    cp1: coverpoint valid { bins b1 ={1}; }
    
    cp2: coverpoint a { bins a1[] = {2,4};
                        //bins a2 = {5};
                      }
    
    cp3: coverpoint b { bins b1 = {[3:9]};
                        bins b2 = {10};
                        bins b3 = {11};
                      }
    
    cp1_X_cp2: cross cp1,cp2;
  endgroup
    
  // Declare the coverage group instance
  cg_intf cg;

  // Constructor to create the coverage group
  
  
endinterface
