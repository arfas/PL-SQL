-- Don't worry about what OBJECT is
-- Think of OBJECT as a complex data structure sort of like record
-- If you know OOP, it is almost identical.
CREATE TYPE address_t AS OBJECT (
   street  VARCHAR2(30),
   city    VARCHAR2(20),
   state   CHAR(2),
   zip     CHAR(5) );
/

-- Now we are going to create a nested table of the complex data type
-- This will allow us to store multiple address for a given customer like a home and an office
CREATE TYPE address_tab IS TABLE OF address_t;
/

-- We now create a table
CREATE TABLE custadd (
   custid  NUMBER,
   address address_tab )
NESTED TABLE address STORE AS customer_addresses;

-- This shows an example of inserting a Nested Table inside the Customers Table.
INSERT INTO custadd VALUES (1,
            address_tab(
              address_t('101 First', 'Redwood Shores', 'CA', '94065'),
              address_t('123 Maple', 'Mill Valley',    'CA', '90952')
            )                );
/
select c.custid, u.* from custadd c, table (c.address) u;
/
DROP Table custadd;
DROP TYPE address_tab;
DROP TYPE address_t;