with text_io;
use text_io;

procedure print is
    package Int_Io is new Integer_Io(Integer);
    use Int_Io;

    task printOdd is
        entry wait;
    end printOdd;
    task printEven;
    
    task body printOdd is 
    begin
        for i in 1..50 loop
            Put(2*i-1);
            accept wait;
        end loop;
    end printOdd;

    task body printEven is 
    begin
        for j in 1..50 loop
            Put(2*j);
            printOdd.wait;
        end loop;
    end printEven;

begin
null;
end print;