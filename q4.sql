set serveroutput on
create or replace procedure associateArrayDemo as
type name_salary is table of number index by varchar2(50);
instance1 name_salary;
name varchar2(50);

begin
instance1('John'):=2000;
instance1('Alex'):=4000;
instance1('Sam'):=3000;
instance1('Chang'):=2000;
instance1('Don'):=1000;

name:=instance1.first;

while name is not null loop
dbms_output.put_line('Name:'||name||'  Salary:'||to_char(instance1(name)));
name:=instance1.next(name);
end loop;
dbms_output.put_line('After deletion and update');
instance1('Sam'):=6000;
instance1.delete('Chang');
name:=instance1.first;

while name is not null loop
dbms_output.put_line('Name:'||name||'  Salary:'||to_char(instance1(name)));
name:=instance1.next(name);
end loop;
end associateArrayDemo;
execute associateArrayDemo;

