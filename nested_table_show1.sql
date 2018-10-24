--Note
-- We are not specifying dimensions
-- Syntax is very similar to other declarations i.e. 
--TYPE <NAME> IS *TABLE* OF *DATATYPE*

--Removing this statement does not create any errors. So please stop writing it for all the questions
--You cannot think of a different answer.
SET SERVEROUTPUT ON;

DECLARE
   -- This statement creates the datatype. It will create a Table of Varchar2(10). This creates the stencil.Or think of it like creating a machine which will churn out Varchar2
   TYPE names_table IS TABLE OF VARCHAR2(10);
   
   -- This statement creates the datatype. It will create a Table of Integers. This creates the stencil. Or think of it like creating a machine
   TYPE salary IS TABLE OF INTEGER;

   --Now we are instantiating the stencil. This machine will now churn out tables of names
   names names_table;
   
      --Now we are instantiating the stencil. This machine will now churn out tables of salary. Name of one of the tables is wages
   wages salary;
   total integer;
BEGIN
   -- We are inserting members into the table in the next two lines
   names := names_table('Jennifer', 'William', 'David', 'George', 'Henry');
   wages:= salary(3000, 4000, 2350, 2040, 1000);
   
   -- We are counting the names
   total := names.count;
   
   -- Plain old print statement
   dbms_output.put_line('Total '|| total || ' Employees');
   FOR i IN 1 .. total LOOP
      dbms_output.put_line('Employee:'||names(i)||', Salary:' || wages(i));
   end loop;
END;
/