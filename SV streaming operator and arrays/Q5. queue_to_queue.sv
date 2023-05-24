// Q5. Write a logic to insert a queue array into another queue array.

module queue_to_queue();

int que1[$];             
int que2[$];            //queue array declared

integer j;

initial 
begin
    
  for (j=0;j<20;j++)    //randomly filling values in dynamic array
  begin
    que1[j]=$urandom_range(0,30);

  end

  que2=que1;			// inserting que1 to que2

  $display("Queue Array 1 : %p\nQueue Array 2 : %p",que1,que2);	 //displaying both the arrays
  if(que1==que2)
  	$display("Copied array successfully");

end
endmodule