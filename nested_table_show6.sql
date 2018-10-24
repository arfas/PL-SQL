DECLARE
   TYPE NumList IS TABLE OF INTEGER;
   n NumList := NumList(1,3,5,7);
BEGIN
   n.DELETE(2); -- Delete the second element
   IF n.EXISTS(1) THEN
      DBMS_OUTPUT.PUT_LINE('OK, element #1 exists.');
   END IF;
   IF n.EXISTS(2) = FALSE THEN
      DBMS_OUTPUT.PUT_LINE('OK, element #2 was deleted.');
   END IF;
   IF n.EXISTS(99) = FALSE THEN
      DBMS_OUTPUT.PUT_LINE('OK, element #99 does not exist at all.');
   END IF;
   
   n(2):=13;
   IF n.EXISTS(2) THEN
      DBMS_OUTPUT.PUT_LINE('OK, element #2 now exists');
   END IF;
   
END;
/
