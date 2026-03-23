module pg_generator(
	input wire [3:0] a,
	input wire [3:0] b,
	output wire [3:0] g,
	output wire [3:0] p
);

	genvar i;

	generate
		for(i = 0; i < 4; i = i + 1) begin: gen_loop
			// Generate (G)
			assign g[i] = a[i] & b[i];
	
			// Propagate (P)
			assign p[i] = a[i] ^ b[i];
		end
	endgenerate

endmodule
