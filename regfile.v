`timescale 1ns/1ps

module regfile(
	input wire clk,
	input wire write_enable,
	input wire [7:0] write_addr,
	input wire [31:0] write_data,
	input wire [7:0] read_addr,
	output reg [31:0] read_data
);
	reg [31:0] registers [0:255];

	always @(posedge clk) begin
		if(write_enable)
						registers[write_addr] <= write_data;
	end

	always @(posedge clk) begin
		read_data <= registers[read_addr];
	end

endmodule
