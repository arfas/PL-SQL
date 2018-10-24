set SERVEROUTPUT ON

create or replace procedure procImplicitCursorClientSelect as
 total_rows number;
 
begin

update client
 set SALARY=salary+1-1;
  if sql%notfound then
  dbms_output.put_line('no rows to select');
  elsif sql%found then
  total_rows:=sql%rowcount;
  dbms_output.put_line(total_rows||'selected rows');
  end if;
  end;
execute procImplicitCursorClientSelect;
  
