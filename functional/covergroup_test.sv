

module test();
    bit clk;
    bit [15:0] cv_a;
    reg [10:0] cv_b;
    reg [16:0] cv_c;
    bit [31:0] mask;

    always #10 clk =~ clk;

    // covergroup cg  @(posedge clk);
    //     c1 : coverpoint cv_a[2:0]
    //     {
        
    //         bins b1 = {1};
    //         bins b2 = {1};
    //         bins b3 = {1};
    //         bins b4 = {1};
    //     }
    //     //c2 : coverpoint cv_b;
    // endgroup

    covergroup cgmaskbit(input bit [31:0] position, ref bit [31:0] vector) @(posedge clk);
        pos: coverpoint (position & vector) !=0
        {
          	bins zero = {1'b0};
		    bins one  = {1'b1};
            //bins tr[] = (1=> 0,0 => 1 );
        }
         
         option.per_instance = 1;
    endgroup

    // covergroup cgmaskbit(ref bit [31:0] vector) @(posedge clk);
    //      pos: coverpoint vector
    //      {
    //       	bins zero = {0};
	// 	    bins one  = {1};
    //      }
    //      option.per_instance = 1;
    // endgroup
 
    cgmaskbit cgmaskbits[32];
 
 
    // covergroup test_cg (input bit cp_reg) ;
        
    //     CP : coverpoint cp_reg
	// {
	// 	bins zero = {1'b0};
	// 	bins one  = {1'b1};
	// }
	// //option.per_instance = 1;

    // endgroup
    // //cg cg_inst;
    // test_cg cg_inst[16];
    
    initial begin
        //cg_inst= new();
	    cv_a = 1;
	    //cg_inst[0] = new(cv_a[0]);
        //foreach (cv_a[i]) cg_inst[i] = new(cv_a[i]);
        foreach (cgmaskbits[i]) cgmaskbits[i] = new(1'b1<<i,mask);
        //foreach (cgmaskbits[i]) cgmaskbits[i] = new(mask);
        // for (int i = 0; i < 32; i++) begin
        //     cgmaskbits[i] = new(mask);
        // end
            $display("Hello");
            for (int i = 0; i < 3; i++) begin
                @(negedge clk);
                //if (i == 0) cv_a = 16'hFF00 ;
                //if (i == 1) cv_a = 16'h00FF ;
                $display("cv_a ", cv_a);
                cv_a = $random;
                mask = $random;
                //$display("[%0t] cv_a=0x%0b", $time, cv_a);
                $display("[%0t] mask=%b", $time, mask);
                for (int j = 0; j < 32; j ++)
                begin
                    $display(mask[j]);
                end
            end
        end

    initial begin
        #500 
	for (int j = 0; j < 32; j ++) begin
		//$display("Coverage = %0.2f %%", cg_inst[j].get_inst_coverage());
		$display("Coverage = %0.2f %%", cgmaskbits[j].get_inst_coverage());
	end
        $display("Coverage check");
        $finish;
    end

endmodule
