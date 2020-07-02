CREATE TABLE gender
(
    -- PRIMARY KEY
    id              NUMBER(1) CONSTRAINT gender_id_nn NOT NULL,
    
    -- ATTRIBUTES
    description_    VARCHAR(10) CONSTRAINT gender_description_nn NOT NULL
);