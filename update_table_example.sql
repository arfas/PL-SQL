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
,address_varray('Office of Senator McCain'
               ,'450 West Paseo Redondo'
               ,'Suite 200')
,'Tucson'
,'AZ'
,'85701'
,'USA');

-- Anonymous block demonstrating PL/SQL varray element update.
DECLARE

  -- Define a record type for a row of the addresses table.
  TYPE address_type IS RECORD
  (address_id          INTEGER
  ,individual_id       INTEGER
  ,street_address      ADDRESS_VARRAY
  ,city                VARCHAR2(20 CHAR)
  ,state               VARCHAR2(20 CHAR)
  ,postal_code         VARCHAR2(20 CHAR)
  ,country_code        VARCHAR2(10 CHAR));

  -- Define a variable of the addresses table record type.
  address              ADDRESS_TYPE;

  -- Define a cursor to return the %ROWTYPE value.
  CURSOR get_street_address
    (address_id_in      INTEGER) IS
    SELECT   *
    FROM     addresses
    WHERE    address_id = address_id_in;

BEGIN

  -- Open the cursor.
  OPEN  get_street_address(11);

  -- Fetch a into the record type variable.
  FETCH get_street_address
  INTO  address;

  -- Close the cursor.
  CLOSE get_street_address;

  -- Reset the first element of the varray type variable.
  address.street_address(1) :=
    'Office of Senator John McCain';

  -- Update the varray column value.
  UPDATE   addresses
  SET      street_address = address.street_address
  WHERE    address_id = 11;

END;
/

-- Create a type to view the formatted varray values.
CREATE OR REPLACE TYPE varray_nested_table
IS TABLE OF VARCHAR2(30 CHAR);
/

-- Query the column value.
SELECT   column_value
FROM     THE (SELECT   CAST(street_address AS varray_nested_table)
              FROM     addresses
              WHERE    address_id = 11);
