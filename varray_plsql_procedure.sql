SET SERVEROUTPUT ON;
DECLARE
   type namesarray IS VARRAY(6) OF VARCHAR2(10);
   type salary IS VARRAY(6) OF INTEGER;
   names namesarray;
   salaries salary;
   total integer;
BEGIN
   names := namesarray('John', 'William', 'Donald', 'Matthew', 'George');
   salaries:= salary(1000, 1500, 2000, 900, 3500);
   total := names.count;
   dbms_output.put_line('Total '|| total || ' Employees');
   FOR i in 1 .. total LOOP
      dbms_output.put_line('Employee: ' || names(i) || ' Salary: ' || salaries(i));
   END LOOP;
END;
/