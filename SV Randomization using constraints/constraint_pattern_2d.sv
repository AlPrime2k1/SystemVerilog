//Q. Pattern where each element is greater than it's previous element in horizontal,vertical and diagonal directions.
module constraint_pattern_2d();
int i,j;
class rando;

rand bit [7:0] dyn [5][5];
  
constraint horizontal {foreach (dyn[i,j]) if ((j!=0))  dyn[i][j]>dyn[i][j-1];}
constraint vertical {foreach (dyn[i,j]) if (i!=0)  dyn[i][j]>dyn[i-1][j];}

function void post_randomize();
	
	$display("array = %p",dyn);
	
	for(j=0;j<5;j++)
	begin
		$display("\n");
		for(i=0;i<5;i++)
		begin
			$write("%d  ",dyn[j][i]);
		end
	end
	$display("\n");
endfunction : post_randomize

endclass

rando rand_h;

initial begin
 rand_h = new();
 assert(rand_h.randomize());
 #10 $finish;
end

endmodule