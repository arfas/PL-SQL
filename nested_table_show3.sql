-- In this example we will store a nested table as a column inside of a table

--Statement which will create a datatype to capture table of table aka nested tables
CREATE OR REPLACE TYPE my_tab_t AS TABLE OF VARCHAR2(30);
/

-- This statement creates a table which is going to store a table as a column
CREATE TABLE nested_table (id NUMBER, col1 my_tab_t)
       NESTED TABLE col1 STORE AS col1_tab;
/
-- The statement starting with NESTED TABLE is necessary to make sure Oracle knows that the colum being stored is a table

-- Notice the insert statement. It takes the form of id followed by name of data structure and then putting values.
-- Notice how we are not churning out something from the machines.
INSERT INTO nested_table VALUES (1, my_tab_t('A'));
INSERT INTO nested_table VALUES (2, my_tab_t('B', 'C'));
INSERT INTO nested_table VALUES (3, my_tab_t('D', 'E', 'F'));
COMMIT;
/
--This will give you a messy representation
SELECT * FROM nested_table;
/
-- This will allow you to format the information to make it appear clearly
-- TABLE constructs allows you to query nested data structures as tables
SELECT id, COLUMN_VALUE FROM nested_table t1, TABLE(t1.col1) t2;

-- You can drop the structures using these constructs
DROP TABLE nested_table;
DROP type my_tab_t;