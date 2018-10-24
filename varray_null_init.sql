CREATE OR REPLACE TYPE integer_varray AS VARRAY(100) OF INTEGER NOT NULL;

/

DECLARE

––Declare and initialize a null set of rows. 

varray_integer INTEGER_VARRAY := integer_varray();

BEGIN

––Loop through all records.

FOR i IN 1..varray_integer.LIMIT LOOP

––Initialize row. 
varray_integer.EXTEND;

END LOOP;

––Print to console how many rows are initialized. dbms_output.put ('Integer Varray Initialized '); dbms_output.put_line('['||varray_integer.COUNT||']');

END;

/