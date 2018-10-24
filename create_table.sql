CREATE TABLE INDIVIDUALS(individual_id number(2),
						first_name varchar2(70),
						middle_initial varchar2(3),
						last_name varchar2(70),
						CONSTRAINT individual_pk PRIMARY KEY(individual_id));
            
/  
CREATE TABLE ADDRESSES(address_id number(2),
                      individual_id number(2),
						street_address1 varchar2(200),
						street_address2 varchar2(200),
            street_address3 varchar2(200),
            city varchar2(50),
            state varchar2(50),
            postal_code number(5),
            country_code varchar2(3),
						CONSTRAINT address_pk PRIMARY KEY(address_id),
            CONSTRAINT fk_individual
              FOREIGN KEY (individual_id)
              REFERENCES INDIVIDUAL(individual_id));
/              
CREATE TABLE TELEPHONES(telephone_id number(2),
                      individual_id number(2),
						address_id number(2),
						telephone_type varchar2(200),
            telephone_number varchar2(200),
						CONSTRAINT telephone_pk PRIMARY KEY(telephone_id),
            CONSTRAINT fk_individual_tel
              FOREIGN KEY (individual_id)
              REFERENCES INDIVIDUAL(individual_id),
            CONSTRAINT fk_addresses_tel
              FOREIGN KEY (address_id)
              REFERENCES ADDRESSES(address_id));
/
commit;