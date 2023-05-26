//Q22. Write a piece of code to randomize a 2-diamensional array to generate below pattern:
/*
1 2 3 4 5
2 3 4 5 6
3 4 5 6 7
4 5 6 7 8
5 6 7 8 9
*/

module constraint_pattern();
int i,j;
class rando;

rand bit [8:0] dyn [5][5];
  
constraint arraycons {foreach(dyn[i,j]) dyn[i][j]==i+j+1;}

function void post_randomize();
	
	$display("array = %p",dyn);
	
	for(j=0;j<5;j++)
	begin
		$display("\n");
		for(i=0;i<5;i++)
		begin
			$write(dyn[j][i]);
		end
		//$display("\n");
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