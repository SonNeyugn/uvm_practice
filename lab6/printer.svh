// Please declare a class called printer that extends agent_with_interface
`include "uvm_macros.svh"
import uvm_pkg::*;
import counter_pkg::*;
class printer extends agent_with_interface;

   // Please use the uvm_component_utils macro to tell the UVM about the 
   // printer class
   `uvm_component_utils(printer);


   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   // Please create a run task that loops forever and prints 
   // out the data on the counter pins at the negative edge 
   // of the clock
   task run_phase(uvm_phase phase);
      //phase.raise_objection(this);
      forever begin
         @(negedge i.clk);
         `uvm_info("info", $psprintf("data_in: %2h  q: %2h   ld: %1b  inc: %1b", i.data_in, i.q, i.ld, i.inc), UVM_MEDIUM);
      end
      //phase.drop_objection(this);
   endtask

endclass : printer


   


   
