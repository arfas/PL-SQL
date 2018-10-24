set serveroutput on;
DECLARE
   CURSOR c_customers is
      SELECT * FROM customers;
BEGIN
   FOR v_customers in c_customers LOOP
      dbms_output.put_line(v_customers.id || ' ' || v_customers.name || ' ' || v_customers.address);
   END LOOP;
END;
/