set SERVEROUTPUT ON
DECLARE
  cv SYS_REFCURSOR;  -- cursor variable
 
  v_name  CLIENT.FIRSTNAME%TYPE;  -- variable for name
  v_age   client.age%TYPE;     -- variable for age
 
  query_2 VARCHAR2(200) :=
    'SELECT * FROM client
    WHERE age > 25
    ORDER BY age';
 
  v_client client%ROWTYPE;  -- record variable row of table
 
BEGIN
  OPEN cv FOR
    SELECT FIRSTNAME, age FROM client
    WHERE salary > 5000 ORDER BY SALARY;
 
  LOOP  -- Fetches 2 columns into variables
    FETCH cv INTO v_name, v_age;
    EXIT WHEN cv%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( RPAD(v_name, 25, ' ') || v_age );
  END LOOP;
 
  DBMS_OUTPUT.PUT_LINE( '-------------------------------------' );
 
  OPEN cv FOR query_2;
 
  LOOP  -- Fetches entire row into the v_customers record
    FETCH cv INTO v_client;
    EXIT WHEN cv%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( RPAD(v_client.firstname, 25, ' ') ||
                               v_client.age );
  END LOOP;
 
  CLOSE cv;
END;
/
