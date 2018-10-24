set serveroutput on 
create or replace procedure nestedTableDemo is
type nametable is table of varchar2(10);
names nametable;
total integer;
begin
names:=nametable('John','Marin','Ben','Cheung','Wang','Lin','Conner','Rauch','Howard','Sheldon','Kyle','Marshall','Dexter','Don','Nickle');
total:=names.count;
for i in 1 .. total loop
dbms_output.put_line('iStudent:'||names(i));
end loop;
names.delete(1);
names.delete(3);
names.delete(5);
names.delete(7);
names.delete(9);
names.delete(11);
names.delete(13);
names.delete(15);
DBMS_OUTPUT.PUT('After deletion'||chr(10));
for i in 1 .. total loop
if names.exists(i)
then
dbms_output.put_line('Student:'||names(i));
end if;
end loop;
end;
execute nestedTableDemo;
