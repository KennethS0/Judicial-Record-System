CREATE TABLE record
(
-- PRIMARY KEY
    id            NUMBER(6) CONSTRAINT record_id_nn NOT NULL,
-- FOREIGN KEY
    resolution_id NUMBER(6),
    type_id       NUMBER(2) CONSTRAINT record_type_nn NOT NULL,
    user_id       NUMBER(6) CONSTRAINT record_user_nn NOT NULL,
    number_id     NUMBER(6) CONSTRAINT record_number_nn NOT NULL,
    sue_id        NUMBER(6) CONSTRAINT record_sue_nn NOT NULL,
    
-- ATTRIBUTES
    description_  VARCHAR(500) CONSTRAINT record_description_nn NOT NULL,
    written_date DATE CONSTRAINT record_date_nn NOT NULL
);