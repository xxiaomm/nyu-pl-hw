with text_io;
use text_io;

procedure print is
    package Int_Io is new Integer_Io(Integer);
    use Int_Io;

    N: integer:= 100;
    task printOdd is
        entry waitOdd;
    end printOdd;

    task printEven is
        entry waitEven;
    end printEven;
    
    task body printOdd is 
    begin
        for i in 1..N loop
            if (i mod 2) = 1 then
                put(i);
            else
                if j-i=1 then
                    printEven.waitEven;
                else
                    accept waitOdd;
                end if;
            end if;
        end loop;
    end printOdd;

    task body printEven is 
    begin
        for j in 2..N loop
            if (j mod 2)= 0 then
                put(j);
            else
                if j-i=1 then
                    accept waitEven;
                else 
                    printOdd.waitOdd;
                end if;
            end if;
        end loop;
    end printEven;

begin
null;
end print;