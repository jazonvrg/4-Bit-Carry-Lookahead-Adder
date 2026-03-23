module rca_4bit(
	input wire [3:0] a,
	input wire [3:0] b,
	input wire cin,
	output wire [3:0] sum,
	output wire cout
);

	wire [4:0] c;

	assign c[0] = cin;
	assign cout = c[4];
	
	genvar i;

	generate
		for(i = 0; i < 4; i = i + 1) begin: gen_adder_loop
			full_adder fa_dut(.a(a[i]), .b(b[i]), .cin(c[i]), .sum(sum[i]), .cout(c[i + 1]));
		end
	endgenerate

endmodule
