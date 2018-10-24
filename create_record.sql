Select * from individuals;

DECLARE
--Define a variable with an implicit record type. 
individual individuals%ROWTYPE;

BEGIN

--Initialize the field values for the record. 
individual.individual_id := 1; 
individual.first_name := 'John'; 
individual.middle_initial := 'D'; 
individual.last_name := 'Rockefeller';

--Insert into the table.

INSERT INTO individuals VALUES (individual.individual_id ,
		individual.first_name ,
		individual.middle_initial ,
		individual.last_name);
COMMIT;
END;
