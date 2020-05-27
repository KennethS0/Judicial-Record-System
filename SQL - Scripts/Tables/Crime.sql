CREATE TABLE crime
(
-- PRIMARY KEY
    id              VARCHAR(6) CONSTRAINT crime_id_nn NOT NULL,
    
-- FOREIGN KEY
    record_id       VARCHAR(6) CONSTRAINT crime_recordid_nn NOT NULL,
    
-- ATTRIBUTES
    description_    VARCHAR2(50) CONSTRAINT crime_description_nn NOT NULL, 
    date_commited   DATE DEFAULT SYSDATE CONSTRAINT crime_date_nn NOT NULL
);