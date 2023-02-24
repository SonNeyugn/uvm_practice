module dff(d,q,clk);
	input d;
	output reg q;
	input clk;
	always @(posedge clk)
		begin
		q <= d;
		end
endmodule
