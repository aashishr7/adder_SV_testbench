// generator class


class generator;
  
  rand transaction trans;
  
  mailbox gen2driv;
  
  int count;
  event ended;
  
  //constructor
  function new(mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    
    repeat(count) begin
      trans = new();
      
      if(!trans.randomize()) begin
        $fatal("Randomization failed??");
      end
      else begin
        $display("!!Randomization Success!!");
       // trans.display();
        gen2driv.put(trans);
      end
      -> ended;
    end
  endtask
      
endclass
