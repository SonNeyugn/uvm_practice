class square_it extends uvm_agent;

  `uvm_component_utils(square_it)    
  
   // Please declare an "uvm_get_port #(int)" that will get data from the producer.
  uvm_get_port #(int) get_port;
   // Please declare an "uvm_put_port #(int)" that will put data into the consumer.
  uvm_put_port #(int) put_port;
  // constructor
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  task run_phase(uvm_phase phase);
    int i;
    super.run_phase(phase);
    forever begin
       // Please get an integer out of the uvm_get_port
       // Please put the square of the integer in the uvm_put_port
       // The square operator in verilog is ** as in "3**2 is 9"
      get_port.get(i);
      put_port.put(i**2);

       

    end
  endtask


  // build
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     // Please create a new uvm_get_port using the variable you declared above
     // Please create a new uvm_put_port using the variable you declared above
    get_port = new("get_port", this);
    put_port = new("put_port", this);
     

  endfunction : build_phase


endclass : square_it
