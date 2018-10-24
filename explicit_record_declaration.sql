DECLARE

--Define a record type.

TYPE individual_record IS RECORD

(individual_id INTEGER
,first_name VARCHAR2(30 CHAR)
,middle_initial individuals.middle_initial%TYPE
,last_name VARCHAR2(30 CHAR));

--Define a variable of the record type. 

individual INDIVIDUAL_RECORD;

BEGIN

--Initialize the field values for the record. 
individual.individual_id := 2; 
individual.first_name := 'John'; 
individual.middle_initial := 'P'; 
individual.last_name := 'Morgan';

--Insert into the table.

INSERT

INTO individuals VALUES (individual.individual_id ,individual.first_name ,individual.middle_initial ,individual.last_name);

--Commit the work. 
COMMIT;

END;

/