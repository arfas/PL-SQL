set SERVEROUTPUT ON
create or replace procedure vArrayDemo is
TYPE namearray IS VARRAY(15) OF VARCHAR2(10);
names namearray;
total integer;
begin
names:=namearray('John','Marin','Ben','Cheung','Wang','Lin','Conner','Rauch','Howard','Sheldon','Kyle','Marshall','Dexter','Don','Nickle');
total:=names.count;
for i in 1 .. total loop
dbms_output.put_line('Names:'||names(i));
end loop;
end;
execute vArrayDemo;