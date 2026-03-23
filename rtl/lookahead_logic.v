module lookahead_logic(
	input wire [3:0] p,
	input wire [3:0] g,
	input wire cin,
	output wire [3:0] c,
	output wire cout
);

	assign c[0] = cin;

	genvar i;

	generate
		for(i = 0; i < 4; i = i + 1) begin: gen_loop
			if (i != 3) begin: gen_internal_carry
				assign c[i + 1] = g[i] | (p[i] & c[i]);
			end
			else begin: gen_carry_out
				assign cout = g[i] | (p[i] & c[i]);
			end
		end
	endgenerate

endmodule
