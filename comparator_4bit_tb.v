`timescale 1ns/1ps
module comparator_4bit_tb;
	reg [3:0] a,b;
	wire gt,eq,lt;
	integer f;
	
	comparator_4bit uut(
		.a(a),
		.b(b),
		.gt(gt),
		.eq(eq),
		.lt(lt)
	);
	
	initial begin
		$display("4-bit COmparator SImulaiton Start");
		
		$dumpfile("comparator_4bit.vcd");
		$dumpvars(0,comparator_4bit_tb);
		
		f=$fopen("monitor_lot.txt","w");
		if(!f) begin
			$display("Failed to open monitor_lot.txt");
			$finish;
		end
		$display("Log file opened");
		
		a=4'b1010; b=4'b0101; #10;
		$fwrite(f,"a=%b,b=%b -> gt=%b, eq=%b, lt=%b @ %0t ns\n", a,b,gt,eq,lt,$time);
		a=4'b1001; b=4'b1001; #10;
		$fwrite(f,"a=%b,b=%b -> gt=%b, eq=%b, lt=%b @ %0t ns\n", a,b,gt,eq,lt,$time);
		a=4'b0011; b=4'b1010; #10;
		$fwrite(f,"a=%b,b=%b -> gt=%b, eq=%b, lt=%b @ %0t ns\n", a,b,gt,eq,lt,$time);
		a=4'b0000; b=4'b1111; #10;
		$fwrite(f,"a=%b,b=%b -> gt=%b, eq=%b, lt=%b @ %0t ns\n", a,b,gt,eq,lt,$time);
		a=4'b1111; b=4'b0000; #10;
		$fwrite(f,"a=%b,b=%b -> gt=%b, eq=%b, lt=%b @ %0t ns\n", a,b,gt,eq,lt,$time);
		
		$fclose(f);
		$display("Simulation Done");
		#100;
		$finish;
	end
endmodule