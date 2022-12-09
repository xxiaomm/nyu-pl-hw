with text_io;
use text_io;
package body Sorting is 

    package Int_Io is new Integer_Io(Integer);
    use Int_Io;
    --execution of quick sort, sorting elements of array from array(low) to array(high)
    procedure QSort(low:in Integer; high:in Integer) is
        i,j: Integer;
        temp,x: array_value;

        task sort_left is  
            entry left;         --entry to sort the left of i-location of the array
        end sort_left;

        task sort_right is 
            entry right;    --entry to sort the right of i-location of the array
        end sort_right;

        task body sort_left is
        begin        
            accept left do   
            if low < (i-1) then 
                QSort(low, i-1);
            else 
                return;
            end if;
            end left;
        end sort_left;

        task body sort_right is
        begin
            accept right do   
            if (i+1) < high then 
                QSort(i+1, high);
            else 
                return;
            end if;
            end right;
        end sort_right;
        
    begin 
        i := low - 1;
        x := A(high);
        j := low;
        for j in low..(high-1) loop
            if A(j) <= x then
                i := i+1;
                temp := A(j);
                A(j) := A(i);
                A(i) := temp;
            end if;
        end loop;
        A(high) := A(i+1);
        A(i+1) := x;
        i := i+1;
        sort_left.left;         --recursion to call QSort to sort the left of A(i) in the array
        sort_right.right;       --recursion to call QSort to sort the left of A(i) in the array

    end QSort;

end Sorting;