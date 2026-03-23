
task run_test();
	begin
		err = 0;	
		$display("===========================================================================");
		$display("======================= TEST NAME : test_exhaustive =======================");
		$display("===========================================================================");
		$display("ITEM: Brute-force check");
		$display("----------------------------------------------------------------------------------------------------------------------");		
		for(i = 0; i < 16; i = i + 1) begin
			for(j = 0; j < 16; j = j + 1) begin
				for(k = 0; k < 2; k = k + 1) begin
					a = i;
					b = j;
					cin = k;
					#1;		
					$display("	CASE: a = %b, b = %b, cin = %b", a, b, cin);
					comp({cout, sum}, a + b + cin);
				end
			end
		end
		a = 4'd0;
		b = 4'd0;
		cin = 1'b0;
		#1;		
		$display("	CASE: a = %b, b = %b, cin = %b", a, b, cin);
		comp({cout, sum}, a + b + cin);
		$display("----------------------------------------------------------------------------------------------------------------------");
        	if (err != 0)
   	        	$display("Test result FAILED");
 	       	else
        		$display("Test result PASSED");
	end
endtask
