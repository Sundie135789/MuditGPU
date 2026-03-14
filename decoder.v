`timescale 1ns/1ps
`include "isa.v"

module decoder(
	input wire [31:0] instruction,
	output wire [3:0] opcode,
	output wire [7:0] dest_reg,
	output wire [7:0] reg_A,
	output wire [7:0] reg_B
);

	assign opcode = instruction[31:28];
	assign dest_reg = instruction[27:20];
	assign reg_A = instruction[19:12];
	assign reg_B = instruction[11:4];

endmodule
