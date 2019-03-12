module alu(x, y, s, of, cf, equ, R, R2);
	input [31:0] x, y;
	input [3:0] s;
	output reg of, cf;
	output equ;
	output reg [31:0] R, R2;
	assign equ = (x == y) ? 1 : 0;
	always @(x or y or s) begin
		case(s)
		4'b0000: begin
			R <= x << y[4:0];
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
		4'b0001: begin
			R <= $signed(x) >>> y[4:0];
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
		4'b0010: begin
			R <= x >> y[4:0];
			R2 <= 0; 
			of <= 0;
			cf <= 0;
		end
		4'b0011: begin
			{R2, R} <= x * y;
			of <= 0;
			cf <= 0;
		end
		4'b0100: begin
			R <= x / y;
			R2 <= x % y;
			of <= 0;
			cf <= 0;
		end
		4'b0101: begin
			R <= x + y;
			R2 <= 0;
			of = x[31]&y[31]&(~R[31]) + (~x[31] & ~y[31] & R[31]);
			cf = (R < x || R < y) ? 1 : 0;
		end
		4'b0110: begin
			R <= x - y;
			R2 <= 0;
			of = x[31]&y[31]&(~R[31]) + (~x[31] & ~y[31] & R[31]);
			cf = (R > x) ? 1 : 0;
		end
		4'b0111: begin
			R <= x & y;
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
		4'b1000: begin
			R <= x | y;
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
		4'b1001: begin
			R <= x ^ y;
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
		4'b1010: begin
			R <= ~(x | y);
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
		4'b1011: begin
			R <= ($signed(x) < $signed(y)) ? 1 : 0;
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
		4'b1100: begin
			R <= ($unsigned(x) < $unsigned(y)) ? 1 : 0;
			R2 <= 0;
			of <= 0;
			cf <= 0;
		end
	endcase
	end
endmodule