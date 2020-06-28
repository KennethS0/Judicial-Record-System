CREATE TABLE crime
(
-- PRIMARY KEY
    id              VARCHAR2(6) CONSTRAINT crime_id_nn NOT NULL,
    
-- FOREIGN KEY
    record_id       NUMBER(6) CONSTRAINT crime_recordid_nn NOT NULL,
    type_id         NUMBER(2) CONSTRAINT crime_type_nn NOT NULL,
    
-- ATTRIBUTES
    date_commited   DATE CONSTRAINT crime_date_nn NOT NULL
);