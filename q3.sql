CREATE TYPE address_nest AS OBJECT (
   address  VARCHAR2(100) );
/

CREATE TYPE address_tab1 IS TABLE OF address_nest;

/

CREATE TABLE customer_info (
   name  varchar2(100),
   postal_address address_tab1 )
NESTED TABLE postal_address STORE AS customer;


INSERT INTO customer_info VALUES ('Ben',
            address_tab1(
              address_nest('12345,Liverpool')
              
            )                );
            INSERT INTO customer_info VALUES ('John',
            address_tab1(
              address_nest('Mill Valley')
              
            )                );
            INSERT INTO customer_info VALUES ('Wang',
            address_tab1(
              address_nest('Napa Valley')
              
            )                );
            INSERT INTO customer_info VALUES ('Alex',
            address_tab1(
              address_nest('Chicago')
              
            )                );
            INSERT INTO customer_info VALUES ('Neo',
            address_tab1(
              address_nest('Union City')
              
            )                );
            INSERT INTO customer_info VALUES ('Richard',
            address_tab1(
              address_nest('Pleasonton')
              
            )                );
            INSERT INTO customer_info VALUES ('Fredd',
            address_tab1(
              address_nest('Fresno')
              
            )                );
            INSERT INTO customer_info VALUES ('Raja',
            address_tab1(
              address_nest('Newyork')
              
            )                );
            INSERT INTO customer_info VALUES ('Mellisa',
            address_tab1(
              address_nest('Mountain View')
              
            )                );
            INSERT INTO customer_info VALUES ('Jack',
            address_tab1(
              address_nest('Fremont')
              
            )                );
            INSERT INTO customer_info VALUES ('Nick',
            address_tab1(
              address_nest('Death Valley')
              
            )                );
            INSERT INTO customer_info VALUES ('Don',
            address_tab1(
              address_nest('Hayward')
              
            )                );
            INSERT INTO customer_info VALUES ('Bryan',
            address_tab1(
              address_nest('SFO')
              
            )                );
            INSERT INTO customer_info VALUES ('Tesla',
            address_tab1(
              address_nest('Fremont')
              
            )                );
            INSERT INTO customer_info VALUES ('Leonard',
            address_tab1(
              address_nest('Pasadena')
              
            )                );
select * from customer_info;
select c.name, u.* from customer_info c, table (c.postal_address) u;
/
update customer_info set postal_address=address_tab1(address_nest('10,downing street,London')) where name='Don';
