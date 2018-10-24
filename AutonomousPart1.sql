CREATE TABLE at_test (
  id           NUMBER       NOT NULL,
  description  VARCHAR2(50) NOT NULL
);

INSERT INTO at_test (id, description) VALUES (1, 'Description for 1');
INSERT INTO at_test (id, description) VALUES (2, 'Description for 2');

SELECT * FROM at_test;