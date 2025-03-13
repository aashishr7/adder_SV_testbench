// Transaction class

class transaction;
  
  rand bit [3:0]a;
  rand bit [3:0]b;
       bit [6:0]c;
  
  constraint A{a inside {2,4}; b inside {[3:9],10,11};}
  
  
  function void display(string name);
    $display("\n------------------Verification Started------------------");
    $display("<<%s>> [ a= %0d + b= %0d ] :: sum [c= %0d] ",name,a,b,c);
    $display("----------------------------------------------------------");
  endfunction
  
  endclass
