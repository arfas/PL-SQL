BEGIN
  FOR i IN (SELECT null
            FROM user_tables
            WHERE table_name = 'INDIVIDUALS') LOOP
    EXECUTE IMMEDIATE 'DROP TABLE individuals CASCADE CONSTRAINTS';
  END LOOP;
END;
/

CREATE TABLE individuals
(individual_id            INTEGER             NOT NULL
,first_name               VARCHAR2(30 CHAR)   NOT NULL
,middle_initial           VARCHAR2(1 CHAR)
,last_name                VARCHAR2(30 CHAR)   NOT NULL
,CONSTRAINT individual_pk PRIMARY KEY (individual_id));

BEGIN
  FOR i IN (SELECT null
            FROM user_tables
            WHERE table_name = 'ADDRESSES') LOOP
    EXECUTE IMMEDIATE 'DROP TABLE addresses CASCADE CONSTRAINTS';
  END LOOP;
END;
/

BEGIN

  -- Loop if a row is found and delete it.
  FOR i IN (SELECT   null
            FROM     user_types
            WHERE    type_name = 'ADDRESS_VARRAY') LOOP

    EXECUTE IMMEDIATE 'DROP TYPE address_varray';
    COMMIT;

  END LOOP;

END;
/

CREATE OR REPLACE TYPE address_varray
  AS VARRAY(3) OF INTEGER;
/

CREATE TABLE addresses
(address_id               INTEGER             NOT NULL
,individual_id            INTEGER             NOT NULL
,street_address           ADDRESS_VARRAY      NOT NULL
,city                     VARCHAR2(20 CHAR)   NOT NULL
,state                    VARCHAR2(20 CHAR)   NOT NULL
,postal_code              VARCHAR2(20 CHAR)   NOT NULL
,country_code             VARCHAR2(10 CHAR)   NOT NULL
,CONSTRAINT address_pk    PRIMARY KEY (address_id)
,CONSTRAINT addr_indiv_fk FOREIGN KEY (individual_id)
 REFERENCES individuals  (individual_id));

BEGIN
  FOR i IN (SELECT null
            FROM user_tables
            WHERE table_name = 'TELEPHONES') LOOP
    EXECUTE IMMEDIATE 'DROP TABLE telephones';
  END LOOP;
END;
/

CREATE TABLE telephones
(telephone_id             INTEGER             NOT NULL
,individual_id            INTEGER             NOT NULL
,address_id               INTEGER
,telephone_type           VARCHAR2(4 CHAR)    NOT NULL
,telephone_number         VARCHAR2(20 CHAR)   NOT NULL
,CONSTRAINT telephone_pk  PRIMARY KEY (telephone_id)
,CONSTRAINT tele_indiv_fk FOREIGN KEY (individual_id)
 REFERENCES individuals  (individual_id)
,CONSTRAINT tele_addr_fk  FOREIGN KEY (address_id)
 REFERENCES addresses    (address_id));
