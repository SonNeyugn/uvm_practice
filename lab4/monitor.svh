class monitor;

   // Please declare a virtual interface of type counter_if called i.
   virtual interface counter_if i;

   // Please create a constructor called new that accepts a 
   // virtual interface counter_if as an argument
   function new (virtual interface counter_if vif);
      i = vif;
   endfunction
   // Please create a task called run that loops forever and 
   task run;
      forever begin
         @(negedge i.clk);
         $display("data_in: 0x%0h => q: 0x%0h  inc: 0x%0h  ld: 0x%0h", i.data_in, i.q, i.inc, i.ld);
      end
      $finish;
   // prints the counter's out on the negative  edge of i.clk.
   endtask

endclass // monitor


