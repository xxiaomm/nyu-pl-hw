
with text_io; -- always need these two lines for reading and printing
use text_io;

procedure hello is

   task Foo;

   task body Foo is
   begin
      Put("In foo");
      New_Line;
   end Foo;

begin
  Put("Hello World"); New_Line;
end Hello;

with text_io;
use text.io;

procedure hello is 

   task foo;
   
   task body foo is
   begin 
      Put("In foo");
      New_Line;
   end foo;


   begin
      Put("hello world");
      New_Line;
   end hello;

