set serveroutput on;
DECLARE
   v_customers customers%rowtype;
   CURSOR c_customers is
      SELECT * FROM customers;
BEGIN
   OPEN c_customers;
   FETCH c_customers into v_customers;
   WHILE c_customers%found LOOP
      dbms_output.put_line(v_customers.id || ' ' || v_customers.name || ' ' || v_customers.address);
      FETCH c_customers into v_customers;
   END LOOP;
   CLOSE c_customers;
END;
/