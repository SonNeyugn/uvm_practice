`include "uvm_macros.svh"
import uvm_pkg::*;
import counter_pkg::*;
class counter_env extends uvm_test;

   `uvm_component_utils(counter_env);

   // Please declare three variable of the following types: driver, scorboard, and printer
   driver driver_h;
   scoreboard scoreboard_h;
   printer printer_h;
   // Please declare a variable called 'verbose' of type int.
   int verbose;
   
   function new(string name="", uvm_component parent);
      super.new(name, parent);
   endfunction : new


   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      // Please create an instance of the driver using the variable you declared above
      driver_h = driver::type_id::create("driver_h", this);

      // Please create an instance of the scoreboard using the variable you declared above
      scoreboard_h = scoreboard::type_id::create("scoreboard_h", this);
      
      
      // Please test the verbose variable.  If it is non-zero create an instance of the printer object
      if (verbose != 0) begin
         printer_h = printer::type_id::create("printer_h", this);
      end

      
   endfunction : build_phase
   
endclass // tester


   


   