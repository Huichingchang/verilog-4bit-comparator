`timescale 1ns/1ps
module comparator_4bit (
	input wire [3:0] a,
	input wire [3:0] b,
	output wire gt,
	output wire eq,
	output wire lt
);

	assign gt= ( a > b )? 1'b1 : 1'b0;
	assign eq= ( a == b )? 1'b1 : 1'b0;
	assign lt= ( a < b )? 1'b1 : 1'b0;
	
endmodule
	