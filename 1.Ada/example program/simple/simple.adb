with text_io;
use text_io;

procedure Simple is

    package Int_io is new integer_io(integer);
    use Int_io;

    task one is 
        entry Go(X:integer);
    end One;

    task Two;

    task body One is 
    begin
        Put(1);
        accept Go(X:Integer) do
            Put(X);
        end Go;
        Put(2);    
    end One;

    task body Two is
    begin 
        Put(3);
        One.Go(4);
        Put(5);
    end Two;


begin
    null;
end Simple;