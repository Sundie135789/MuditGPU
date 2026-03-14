`timescale 1ns/1ps
module pll_connector( // pll takes input from external crystal oscillator, and outputs fastttttt brrr
  input wire clk_in,
  output reg clk_out = 0 
);
	always @(clk_in) begin
		#0.25 clk_out <= ~clk_out;
	end
endmodule

module testbench;  // testing
	reg clk = 0;
	wire fast_clk;
	pll_connector pll(.clk_in(clk), .clk_out(fast_clk));
	wire [31:0] read_data;
	reg write_enable = 0;
	reg [7:0] write_addr = 0;
	reg [31:0] write_data = 0;
	reg [7:0] read_addr = 0;

	regfile rf(.clk(fast_clk), .write_enable(write_enable), .write_addr(write_addr), .write_data(write_data), .read_addr(read_addr));
	always #0.5 clk = ~clk;

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(0, testbench);
		#10 write_enable = 1;
		write_addr = 8'd5;
		write_data = 32'd42;
		#2 write_enable = 0;
		#2 read_addr = 8'd5;
		#20;
		$finish;
	end
endmodule // stop module.
