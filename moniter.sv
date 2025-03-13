//


class moniter;
  
  virtual intf v_intf;
  
  mailbox mon2scb;
  
  
  function new(virtual intf v_intf, mailbox mon2scb);
    this.v_intf= v_intf;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    transaction trans;
    forever begin
      trans=new();
      wait(v_intf.valid);
      @(posedge v_intf.clk)
      trans.a = v_intf.a;
      trans.b = v_intf.b;
      @(posedge v_intf.clk)
      trans.c = v_intf.c;
      
      @(posedge v_intf.clk)
      mon2scb.put(trans);
      trans.display("MON");
    end
  endtask
endclass
      
      
