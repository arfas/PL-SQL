SET SERVEROUTPUT ON
DECLARE
  TYPE country_tab IS TABLE OF VARCHAR2(50)
    INDEX BY VARCHAR2(5);

  count_value number(2);
  t_country country_tab;
BEGIN

  -- Populate lookup
  t_country('UK') := 'United Kingdom';
  t_country('US') := 'United States of America';
  t_country('FR') := 'France';
  t_country('DE') := 'Germany';
  
  count_value := t_country.count;

  DBMS_OUTPUT.PUT_LINE('Size of Associative Array = ' || count_value);

  
  -- Find country name for ISO code "DE"
  --DBMS_OUTPUT.PUT_LINE('ISO code "DE" = ' || t_country('DE'));

  t_country.delete;

  count_value := t_country.count;

  DBMS_OUTPUT.PUT_LINE('Size of Associative Array = ' || count_value);


END;
/