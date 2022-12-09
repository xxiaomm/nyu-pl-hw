with text_io, Sorting;
use text_io, Sorting;


procedure MainProg is

    package I_io is new integer_io(array_value);
    use I_io;
    package Int_Io is new Integer_Io(Integer);
    use Int_Io;

    input : array_value;  --get the array's value from terminal
    sum : integer := 0;   --declaration of the sum of sorted array's elements

    task SortingTask is
        entry SortingArray;  --start to sort 
    end SortingTask;
   
    task AddingTask is
        entry Summing;   --start to sum all sorted elements
    end AddingTask;
   
    task PrintingTask is
        entry ReadValues;       --get values from terminal
        entry PrintOriginal;    --print the unsorted array
        entry PrintSorted;      --print the sorted array
        entry PrintSum;         --print the sum of the sorted array
    end PrintingTask;


   task body PrintingTask is
   begin
        accept ReadValues do 
            for i in 1..SIZE loop
                I_IO.get(input);
                A(i):= input;
            end loop;
        end ReadValues;
        
        accept PrintOriginal do
            Put("the unsorted elements in array are: ");
            new_line;
            for i in 1..SIZE loop
                Put(integer'image(integer(A(i))));
            end loop; 
            new_line;
        end PrintOriginal; 

        SortingTask.SortingArray;

        accept PrintSorted  do
            Put("the sorted elements in array are: ");
            new_line;
            for i in 1..SIZE loop
                Put(integer'image(integer(A(i))));
            end loop; 
            new_line;
        end PrintSorted;

        accept PrintSum  do
            Put("the sum of the sorted elements is:");
            Put(sum);
        end PrintSum;
        
    end PrintingTask;

    task body SortingTask is
    begin
        accept SortingArray do
             QSort(1,SIZE);
             Put("task SortingArray over");
        end SortingArray;
        PrintingTask.PrintSorted;
        AddingTask.Summing;
    end SortingTask;


   
    task body AddingTask is
        sumtemp : integer := 0;
    begin 
        accept Summing do
            for i in 1..SIZE loop
            sumtemp := sumtemp + integer(A(i));
            end loop;
            sum := sumtemp;
        end Summing;
        PrintingTask.PrintSum;
    end AddingTask;
 
begin
   PrintingTask.ReadValues;
   PrintingTask.PrintOriginal;
end MainProg;

