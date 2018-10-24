DECLARE
  type name_list is varray (6) of customers.name%type;
  names name_list;
  
BEGIN
  SELECT name bulk collect INTO names from customers;
  
  FOR i IN names.FIRST .. names.LAST
    LOOP
        dbms_output.put_line(names(i));
    END LOOP;
END;
/

