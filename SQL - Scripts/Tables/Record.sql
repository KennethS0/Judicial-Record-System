CREATE TABLE record
(
-- PRIMARY KEY
    id            NUMBER(6) CONSTRAINT record_id_nn NOT NULL,
-- FOREIGN KEY
    resolution_id NUMBER(6) CONSTRAINT record_resolution_nn NOT NULL,
    type_id       NUMBER(2) CONSTRAINT record_type_nn NOT NULL,
    user_id       NUMBER(6) CONSTRAINT record_user_nn NOT NULL,
    person_id     NUMBER(10) CONSTRAINT record_person_nn NOT NULL,
-- ATTRIBUTES
    description_  VARCHAR(250) CONSTRAINT record_description_nn NOT NULL,
    creation_date DATE DEFAULT SYSDATE CONSTRAINT record_date_nn NOT NULL
);