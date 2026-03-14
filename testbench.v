`timescale 1ns/1ps
`include 	"isa.v"
module testbench;
	reg clk = 0;
	always #0.5 clk = ~clk;
	reg [31:0] instruction = `INSTR(`ADD, 8'd15, 8'd5, 8'd10);

	wire [3:0] opcode;
	wire [7:0] dest_reg;
	wire [7:0] reg_A;
	wire [7:0] reg_B;

	decoder dec(.instruction(instruction), .opcode(opcode), .dest_reg(dest_reg), ,reg_A(reg_A), .reg_B(reg_B));
	
	wire [31:0] read_data_A;
	wire [31:0] read_data_B;
	reg write_enable = 0;
	reg [7:0] write_addr = 0;
	reg [31:0] write_data = 0;

	regfile rfA(.clk(clk), .write_enable(write_enable), .write_addr(write_addr), .read_addr(reg_A), .read_data(read_data_A));
	regfile rfB(.clk(clk), .write_enable(write_enable), .write_addr(write_addr), .read_addr(reg_B), .read_data(read_data_B));

	wire [31:0] alu_result;
	alu u(.clk(clk), .opcode(opcode[1:0]), .A(read_data_A), .B(read_data_B), .result(alu_result));

	initial begin 
		$dumpfile("out.vcd");
		$dumpvars(0, testbench);
		#2 write_enable = 1; write_addr = 8'd5; write_data = 32'd20;
		#2 write_enable = 1; write_addr = 8'd10; write_data = 32'd7;
		#2 write_enable = 0;

		#4;

		#2 write_enable = 1; write_addr = dest_reg; write_data = alu_result;
		#2 write_enable = 0;
		
		#4;
		$display("ADD R5(20) + R10(7) = R15(%0d) -- expect 27", alu_result);
		$finish;
	end
endmodule
