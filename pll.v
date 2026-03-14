`timescale 1ns/1ps
module pll_connector( // pll takes input from external crystal oscillator, and outputs fastttttt brrr
  input wire clk_in,
  output reg clk_out = 0 
);
	always @(clk_in) begin
		#0.25 clk_out <= ~clk_out;
	end
endmodule


