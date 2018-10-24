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
(individual INDIVIDUAL_RECORD,
address ADDRESS_RECORD);

--Define auser-definedcompound record type. 

individual_address INDIVIDUAL_ADDRESS_RECORD;

BEGIN

--Initialize the field values for the record. 
individual_address.individual.individual_id := 3; 
individual_address.individual.first_name := 'Ulysses'; 
individual_address.individual.middle_initial := 'S'; 
individual_address.individual.last_name := 'Grant';

--Initialize the field values for the record. 
individual_address.address.address_id := 1; 
individual_address.address.individual_id := 3; 
individual_address.address.street_address1 :='Riverside Park'; 
individual_address.address.street_address2 := '';
individual_address.address.street_address3 := ''; 
individual_address.address.city := 'New York City'; 
individual_address.address.state := 'New York'; 
individual_address.address.postal_code := '10027';
individual_address.address.country_code := 'USA';

--Insert the values into the target object. 

INSERT INTO individuals VALUES
(individual_address.individual.individual_id ,
individual_address.individual.first_name,
individual_address.individual.middle_initial,
individual_address.individual.last_name);

--Insert the values into the target object. 
INSERT INTO addresses VALUES
  (individual_address.address.address_id, 
	individual_address.address.individual_id ,
	individual_address.address.street_address1 ,
	individual_address.address.street_address2 ,
	individual_address.address.street_address2 ,
	individual_address.address.city ,
	individual_address.address.state ,
	individual_address.address.postal_code ,
	individual_address.address.country_code);

--Commit the record.

COMMIT;

END;

/

select * from individuals;
select * from addresses;