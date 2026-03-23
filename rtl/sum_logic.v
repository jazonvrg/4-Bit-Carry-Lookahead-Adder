module sum_logic(
	input wire [3:0] p,
	input wire [3:0] c,
	output wire [3:0] sum
);

	genvar i;

	generate
		for(i = 0; i < 4; i = i + 1) begin: gen_loop
			// Sum
			assign sum[i] = p[i] ^ c[i];
		end
	endgenerate

endmodule
