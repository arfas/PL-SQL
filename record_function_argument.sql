DECLARE

--Define a record type.

TYPE individual_record IS RECORD
(individual_id INTEGER
,first_name VARCHAR2(30 CHAR)
,middle_initial VARCHAR2(1 CHAR)
,last_name VARCHAR2(30 CHAR));

--Define a record type.

TYPE address_record IS RECORD
(address_id INTEGER
,individual_id INTEGER
,street_address1 VARCHAR2(30 CHAR)
,street_address2 VARCHAR2(30 CHAR)
,street_address3 VARCHAR2(30 CHAR)
,city VARCHAR2(20 CHAR)
,state VARCHAR2(20 CHAR)
,postal_code VARCHAR2(20 CHAR)
,country_code VARCHAR2(10 CHAR));

--Define a record type of twouser-definedrecord types. 

TYPE individual_address_record IS RECORD
(individual INDIVIDUAL_RECORD
,address ADDRESS_RECORD);

--Define auser-definedcompound record type. 

individual_address INDIVIDUAL_ADDRESS_RECORD;

--Define a local procedure to manage addresses inserts. 

PROCEDURE insert_address (address_in ADDRESS_RECORD) IS
BEGIN

--Insert the values into the target object. 
INSERT INTO addresses VALUES (address_in.address_id,address_in.country_code);

END insert_address;

--Define a local procedure to manage addresses inserts. 

PROCEDURE insert_individual (individual_in INDIVIDUAL_RECORD) IS

BEGIN

--Insert the values into the table. 
INSERT INTO individuals VALUES
(individual_in.individual_id ,
individual_in.first_name,
individual_in.middle_initial,
individual_in.last_name);

END insert_individual;

BEGIN

--Initialize the field values for the record. 

individual_address.individual.individual_id := 6; 
individual_address.individual.first_name := 'Ruldolph'; 
individual_address.individual.middle_initial := ''; 
individual_address.individual.last_name := 'Gulianni';

--Initialize the field values for the record. 
individual_address.address.address_id := 3; 
individual_address.address.individual_id := 6; 
individual_address.address.street_address1 := '89th St'; 
individual_address.address.street_address2 := ''; 
individual_address.address.street_address3 := ''; 
individual_address.address.city := 'New York City'; 
individual_address.address.state := 'NY'; 
individual_address.address.postal_code := '10028'; 
individual_address.address.country_code := 'USA';

--Create a savepoint.

SAVEPOINT addressbook;

--Process object subtypes. 
insert_individual(individual_address.individual); 
insert_address(individual_address.address);

––Commit the record.
COMMIT;

EXCEPTION

--Rollback to savepoint on error. 
WHEN OTHERS THEN
ROLLBACK to addressbook; 
RETURN;
END;

/