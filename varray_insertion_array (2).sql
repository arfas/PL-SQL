/*
 * varray_dml1.sql
 * Chapter 6, Oracle10g PL/SQL Programming
 * by Ron Hardman, Michael McLaughlin and Scott Urman
 *
 * This script inserting and reading from a varray.
 */

SET ECHO ON
SET SERVEROUTPUT ON SIZE 1000000

-- Clean up environment.
BEGIN

  FOR i IN (SELECT   null
            FROM     addresses
            WHERE    address_id = 11) LOOP
    EXECUTE IMMEDIATE 'DELETE FROM addresses WHERE address_id = 11';
  END LOOP;

  FOR i IN (SELECT   null
            FROM     individuals
            WHERE    individual_id = 11) LOOP
    EXECUTE IMMEDIATE 'DELETE FROM individuals WHERE individual_id = 11';
  END LOOP;

  COMMIT;

END;
/

-- Insert into individual because of mandatory parent key constraint.
INSERT
INTO     individuals
VALUES
('11'
,'John'
,''
,'McCain');

-- Insert into address using the varray structure.
INSERT
INTO     addresses
VALUES
(11
,11
,address_varray
  ('Office of Senator McCain'
  ,'450 West Paseo Redondo'
  ,'Suite 200')
,'Tucson'
,'AZ'
,'85701'
,'USA');

-- Use an ordinary select statement.
SELECT   street_address
FROM     addresses;

-- Create a PL/SQL table data type.
CREATE OR REPLACE TYPE varray_nested_table
IS TABLE OF VARCHAR2(30 CHAR);
/


-- Use SQL*Plus to format the output.
COL column_value FORMAT A30

-- Print a list of the varray elements.
SELECT   column_value
FROM     THE (SELECT   CAST(street_address AS
                            varray_nested_table)
              FROM     addresses
              WHERE    address_id = 11);
