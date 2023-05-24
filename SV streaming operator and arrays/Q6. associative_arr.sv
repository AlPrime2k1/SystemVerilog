// Q6. Declare an associative array and write 10 random values on 10 random locations (non-contiguous). 
//Write a logic to print all entries with their associative index. 

module associative_arr();
int asri[int];

integer a;
integer i,j;
int x;

initial 
begin
for(i=0;i<10;i++)
begin
    asri[$urandom_range(0,50)]=$urandom_range(10,100);      //filling random values
end

foreach (asri[i])
begin
    if(asri.exists(i))                              //displaying array index and values
        $display("Index=%d\tValue=%d",i,asri[i]);
end

$display("SIZE=%d",asri.size);                      //returns size

$display("NUMBER=%d",asri.num);                     // returns number of elements
    
if(asri.last(x))
    $display("LAST element [%0d]=%0d",x,asri[x]);               //assigns last index to x

if(asri.prev(x))
    $display("PREVIOUS element [%0d]=%0d",x,asri[x]);           //assigns previous index of x
 
if(asri.first(x))                                               //assigns first index to x
    $display("FIRST element [%0d]=%0d",x,asri[x]);

if(asri.next(x))                                                //assigns next index of x
    $display("NEXT element [%0d]=%0d",x,asri[x]);

$display("Array before deleting : %p",asri);

for(j=0;j<$urandom_range(15,30);j++)
begin                                                   //deleting some random elemenst
if(asri.exists(j))
    asri.delete(j);
end   
$display("Array after deleting some element : %p",asri);

asri.delete();                                          //deleting the array
end

initial 
$monitor("Array after deleting=%p\n",asri);

endmodule
