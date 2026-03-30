`timescale 1ns/1ps

module tb_memory;
	logic clk;
	logic write_enable;
	logic [31:0] write_data;
	logic [7:0] write_address;
	logic [31:0] read_data;
	logic [7:0] read_address;
	
	memory uut(.clk(clk), .write_enable(write_enable), .write_data(write_data), .write_address(write_address), .read_data(read_data), .read_address(read_address));

	always #5 clk = ~clk;

	initial begin
		$dumpfile("tb_memory.vcd");
		$dumpvars(0, tb_memory);
		// one vertex = 32 bit
		// one register = 32 bit
		// no FPU 
		clk = 0;
		write_enable = 1;
		write_address = 8'd0; 
		write_data = {16'd800, 16'd800};
		#10;
		write_address = 8'd1;
		write_data = {16'd1000, 16'd1000};
		#10;
		write_address = 8'd2;
		write_data = {16'd900, 16'd1200};
		#10;
		write_address = 8'd3;
		// R, G, B. Each is 8 bit. so total 3 bytes.
		write_data = {8'd255, 8'd128, 8'd0, 8'd0};
		#10;
		$finish;
	end
endmodule
