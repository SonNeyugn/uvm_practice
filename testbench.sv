module tb();
bit clk, d;
wire q;
dff DUT(.d(d), .q(q), .clk(clk));

always #10 clk = ~clk;

initial begin 

 d <= 0;
 #100;
 d <= 1;
 #100;
 d <= 0;
 #100;
 d <= 1;
end 
endmodule