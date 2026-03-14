`timescale 1ns/1ps

module alu(
	input wire clk,
	input wire [1:0] opcode,
	input wire [31:0] A,
	input wire [31:0] B,
	output reg [31:0] result
);

	always @(posedge clk) begin
		case(opcode)
			2'b00: result <= A + B;
			2'b01: result <= A - B;
			2'b10: result <= A * B;
			default: result <= 32'd0;
		endcase
	end
endmodule
