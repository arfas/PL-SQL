set serveroutput on;

CREATE OR REPLACE PROCEDURE cust_print(cur IN SYS_REFCURSOR) AS
    cust_rec customers%ROWTYPE;
  BEGIN
      DBMS_OUTPUT.PUT_LINE('IN HERE');
    LOOP
      FETCH cur INTO cust_rec;
      EXIT WHEN cur%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Name = ' || 
        cust_rec.name || ' ' || cust_rec.address);
    END LOOP;
  END;

CREATE OR REPLACE PROCEDURE run_procedure AS
  sys_cur SYS_REFCURSOR;
BEGIN
  OPEN sys_cur FOR SELECT * FROM customers;
  cust_print(sys_cur);
  CLOSE sys_cur;
END;
/

exec run_procedure;