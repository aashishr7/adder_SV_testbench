//


class driver;
  
  virtual intf v_intf;
  mailbox gen2driv;
  
  int no_of_transaction;
  
  function new(virtual intf v_intf, mailbox gen2driv);
    this.v_intf = v_intf;
    this.gen2driv = gen2driv;
    
  endfunction
  
  task reset();
    wait(v_intf.rst) 
    $display("[DRIVER]::Reset started");
      v_intf.valid <= 0;
      v_intf.a <=0;
      v_intf.b <=0;
    $display("[DRIVER]:: a=%0d , b=%0d , valid=%0d",v_intf.a,v_intf.b,v_intf.valid);
    wait(!v_intf.rst)
    $display("[DRIVER]::Reset completed");
      
  endtask
  
  task main();
    
    forever begin
      transaction trans;
      gen2driv.get(trans);
      
      @(posedge v_intf.clk) begin
        v_intf.valid <=1;
        v_intf.a <= trans.a;
        v_intf.b <= trans.b;
      end
      
      @(posedge v_intf.clk) begin
        v_intf.valid <=0;
        trans.c <= v_intf.c;
      end
      
      @(posedge v_intf.clk) begin
        $display("[DRIVER]:: main");
      end
      //trans.display("DRIV");
      no_of_transaction++;
    end
  endtask
  
endclass
      
      
        
  
    
    
      
