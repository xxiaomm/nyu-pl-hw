-- Semaphore package

package body sem is

  task body semtask is
  begin
     loop
        select
           accept P;
           accept V;
        or
           terminate;
        end select;
     end loop;
  end semtask;

  function newsem return semaphore is
  begin
    return new semtask;
  end newsem;


  procedure P(s: semaphore) is
  begin
    s.P;
  end;

  procedure V(s: semaphore) is
  begin
    s.V;
  end;

end sem;
