SELECT address, CURSOR(SELECT name, salary 
   FROM customers c
   WHERE c.id = d.id)
   FROM customers d;