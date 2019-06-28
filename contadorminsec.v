module contadorminsec (

input clk,
input rst_n, 
output reg [6:0] min1,
output reg [6:0] min2,
output reg [6:0] sec1,
output reg [6:0] sec2

);

reg [24:0] count;
reg [3:0] c_sec1;
reg [3:0] c_sec2;
reg [3:0] c_min1;
reg [3:0] c_min2;

always @ (posedge clk or negedge rst_n)
begin 
	
	if (!rst_n) begin
		sec1 <= 7'b1000000;
		sec2 <= 7'b1000000;
		min1 <= 7'b1000000;
		min2 <= 7'b1000000;
		count <= 25'd0;
		c_sec1 <= 4'd0;
		c_sec2 <= 4'd0;
		c_min1 <= 4'd0;
		c_min2 <= 4'd0;
	end
	else begin
		count <= count + 25'b1;
		
		
		if (count == 25'd25000000) begin
			c_sec1 <= c_sec1 + 4'd1;
			
			if (c_sec1 == 4'd9) begin
				
				c_sec1 <= 4'd0;
				c_sec2 <= c_sec2 +  4'd1;
				
				if (c_sec2 >= 4'd5 && c_sec1 >= 4'd9) begin
					c_sec2 <= 4'd0;
					c_sec1 <= 4'd0;
					c_min1 <= c_min1 + 4'd1;
					
					if(c_min1 >= 4'd9) begin
						c_min2 <= c_min2 + 4'd1;
						c_sec2 <= 4'd0;
						c_sec1 <= 4'd0;
						c_min1 <= 4'd0;
						
						if (c_min2 >= 4'd9 && c_min1 >= 4'd9) begin
							c_sec2 <= 4'd0;
							c_sec1 <= 4'd0;
							c_min1 <= 4'd0;
							c_min2 <= 4'd0;
						end
					end
				end
			end
				
		end
	
	
		case (c_sec1)
		
			4'b0000 : sec1 <= 7'b1000000; // 0
			4'b0001 : sec1 <= 7'b1111001; // 1
			4'b0010 : sec1 <= 7'b0100100; // 2
			4'b0011 : sec1 <= 7'b0110000; // 3 0110000
			4'b0100 : sec1 <= 7'b0011001; // 4 0011001
			4'b0101 : sec1 <= 7'b0010010; // 5 0010010
			4'b0110 : sec1 <= 7'b0000010; // 6 0000010
			4'b0111 : sec1 <= 7'b1111000; // 7 1111000
			4'b1000 : sec1 <= 7'b0000000; // 8 0000000
			4'b1001 : sec1 <= 7'b0011000; // 9 0011000
		endcase 
	
		case (c_sec2)
		
			4'b0000 : sec2 <= 7'b1000000; // 0
			4'b0001 : sec2 <= 7'b1111001; // 1
			4'b0010 : sec2 <= 7'b0100100; // 2
			4'b0011 : sec2 <= 7'b0110000; // 3 0110000
			4'b0100 : sec2 <= 7'b0011001; // 4 0011001
			4'b0101 : sec2 <= 7'b0010010; // 5 0010010
			4'b0110 : sec2 <= 7'b0000010; // 6 0000010
			4'b0111 : sec2 <= 7'b1111000; // 7 1111000
			4'b1000 : sec2 <= 7'b0000000; // 8 0000000
			4'b1001 : sec2 <= 7'b0011000; // 9 0011000
		endcase
	
		case (c_min1)
		
			4'b0000 : min1 <= 7'b1000000; // 0
			4'b0001 : min1 <= 7'b1111001; // 1
			4'b0010 : min1 <= 7'b0100100; // 2
			4'b0011 : min1 <= 7'b0110000; // 3 0110000
			4'b0100 : min1 <= 7'b0011001; // 4 0011001
			4'b0101 : min1 <= 7'b0010010; // 5 0010010
			4'b0110 : min1 <= 7'b0000010; // 6 0000010
			4'b0111 : min1 <= 7'b1111000; // 7 1111000
			4'b1000 : min1 <= 7'b0000000; // 8 0000000
			4'b1001 : min1 <= 7'b0011000; // 9 0011000
		endcase
		case (c_min2)
		
			4'b0000 : min2 <= 7'b1000000; // 0
			4'b0001 : min2 <= 7'b1111001; // 1
			4'b0010 : min2 <= 7'b0100100; // 2
			4'b0011 : min2 <= 7'b0110000; // 3 0110000
			4'b0100 : min2 <= 7'b0011001; // 4 0011001
			4'b0101 : min2 <= 7'b0010010; // 5 0010010
			4'b0110 : min2 <= 7'b0000010; // 6 0000010
			4'b0111 : min2 <= 7'b1111000; // 7 1111000
			4'b1000 : min2 <= 7'b0000000; // 8 0000000
			4'b1001 : min2 <= 7'b0011000; // 9 0011000
		endcase
	end	

end 

//assign saida;

endmodule

