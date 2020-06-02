CREATE TABLE type_of_record
(
-- PRIMARY KEY
    id          NUMBER(2) CONSTRAINT recordtype_id_nn NOT NULL,
-- ATTRIBUTES
    description VARCHAR2(20) CONSTRAINT recordtype_description_nn NOT NULL
);