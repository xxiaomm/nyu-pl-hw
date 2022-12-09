with text_io;
use text_io;

package Sorting is
    SIZE: constant Integer:= 40;   -- the fixed size of the array
    
    type array_value is range 0 .. 500;     --restrict the elements of array to be integers between 0 and 500. 
    type array_to_sort is array(1 .. SIZE) of array_value;  --declaring a type of unsorted array
    
    A: array_to_sort;   --global variable that all procedure share 
    procedure QSort(low:in Integer; high:in Integer);   --declaration of the procedure of quick sort

end Sorting;