//

class scoreboard;
  
  int no_of_transaction;
  
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
    
  endfunction
  
  task main();
    transaction trans;
    forever begin
      mon2scb.get(trans);
      
      if((trans.a + trans.b) == trans.c) begin
        $display("Result is as expected");
      end
      else begin
        $error("!!??wrong result??!!");
      end
      no_of_transaction++;
      trans.display("SCB");
    end
  endtask
endclass
