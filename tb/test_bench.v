module test_bench (
);

	reg [3:0] a, b;
	reg cin;
	wire [3:0] sum;
	wire cout;

	integer err, i, j, k;

	rca_4bit top_dut(.*);
	
	`include "run_test.v"

	initial begin
		#25;
		run_test();
		#100;
		$finish;
	end

	task comp;
		input [4:0] data;
		input [4:0] cp;
		begin	
			if (data == cp) begin
				$display("t = %t. PASSED. Exp: %b, Act: %b", $time, cp, data);
			end
			else begin
				$display("t = %t. FAILED. Exp: %b, Act: %b", $time, cp, data);
				err = err + 1;
			end
		end
	endtask

endmodule
