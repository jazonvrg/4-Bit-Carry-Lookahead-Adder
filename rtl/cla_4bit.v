module cla_4bit(
	input wire [3:0] a,
	input wire [3:0] b,
	input wire cin,
	output wire [3:0] sum,
	output wire cout
);

	/* verilator lint_off UNOPTFLAT */
	wire [3:0] c, g, p;
	/* verilator lint_on UNOPTFLAT */

	pg_generator pg_top(
		.a (a),
		.b (b),
		.p (p),
		.g (g)
	);

	lookahead_logic lookahead_top(
		.p    (p),
		.g    (g),
		.cin  (cin),
		.c    (c),
		.cout (cout)
	);

	sum_logic sum_top(
		.p   (p),
		.c   (c),
		.sum (sum)
	);

endmodule
