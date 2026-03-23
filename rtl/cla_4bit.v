module cla_4bit(
	input wire [3:0] a,
	input wire [3:0] b,
	input wire cin,
	output wire [3:0] sum,
	output wire cout
);

	/* verilator lint_off UNOPTFLAT */
	wire [4:0] c;
	/* verilator lint_on UNOPTFLAT */

	wire [3:0] g, p;

	assign c[0] = cin;
	assign cout = c[4];

	genvar i;

	generate
		for(i = 0; i < 4; i = i + 1) begin: gen_loop
			// Generate (G)
			assign g[i] = a[i] & b[i];
	
			// Propagate (P)
			assign p[i] = a[i] ^ b[i];

			// Lookahead Carry Logic
			assign c[i + 1] = g[i] | (p[i] & c[i]);

			// Sum
			assign sum[i] = p[i] ^ c[i];
		end
	endgenerate

endmodule
