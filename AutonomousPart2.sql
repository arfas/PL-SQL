DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  FOR i IN 3 .. 10 LOOP
    INSERT INTO at_test (id, description)
    VALUES (i, 'Description for ' || i);
  END LOOP;
  COMMIT;
END;
/
SELECT * FROM at_test;