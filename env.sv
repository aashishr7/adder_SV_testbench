//

`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "moniter.sv"
`include "scoreboard.sv"

class environment;
  
  virtual intf v_intf;
  
  generator gen;
  driver driv;
  moniter mon;
  scoreboard scb;
  
  mailbox gen2driv;
  mailbox mon2scb;
  
  //constructor
  function new(virtual intf v_intf);
    this.v_intf=v_intf;
    
    //creating the mailbox (Same handle will be shared across generator and driver)
    gen2driv=new();
    mon2scb=new();
    
    gen = new(gen2driv);
    driv = new(v_intf,gen2driv);
    mon = new(v_intf,mon2scb);
    scb = new(mon2scb);
    
  endfunction
  
  task pre_test();
    driv.reset();
  endtask
  
  task test();
    fork
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join_any
  endtask
  
  task post_test();
    wait(gen.ended.triggered);
    wait(gen.count==driv.no_of_transaction);
    wait(gen.count==scb.no_of_transaction);
  endtask
  
  task run();
    pre_test();
    test();
    post_test();
    $finish;
  endtask
  
endclass
  
  
