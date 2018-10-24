DECLARE
   TYPE salary IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
   salary_list salary;
   name VARCHAR2(20);
BEGIN
   -- adding elements to the table
   salary_list('Jennifer')  := 62000;
   salary_list('Robin')  := 75000;
   salary_list('Kevin') := 100000;
   salary_list('Matthew') := 78000;

   -- printing the table
   name := salary_list.FIRST;
   WHILE name IS NOT null LOOP
      dbms_output.put_line
      ('Salary of ' || name || ' is ' || TO_CHAR(salary_list(name)));
      name := salary_list.NEXT(name);
   END LOOP;
END;
/