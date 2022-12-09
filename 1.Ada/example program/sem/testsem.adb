with text_io;
with sem;

use text_io;
use sem;

procedure testsem is
 s: semaphore;
begin
   s := newsem;
   P(s);   -- try switching the order of P & V here and see what happens
   V(s);
 put("done");
 new_line;
end testsem;