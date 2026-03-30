
module memory(
	input logic clk,
	input logic write_enable,
	input logic [31:0] write_data,
	input logic [7:0] write_address,
	output logic [31:0] read_data,
	input logic [7:0] read_address
);
logic [31:0] membuffer [255:0];

always_ff @(posedge clk) begin
	if (write_enable) begin
		membuffer[write_address] <= write_data;
	end
	read_data <= membuffer[read_address];
end

endmodule
