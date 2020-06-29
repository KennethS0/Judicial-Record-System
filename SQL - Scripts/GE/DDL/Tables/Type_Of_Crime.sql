CREATE TABLE type_of_crime
(
    -- PRIMARY KEYS
    id  NUMBER(2) CONSTRAINT type_of_crime_id_nn NOT NULL,
    -- FOREIGN KEYS
    
    -- ATTRIBUTES
    name VARCHAR2(50) CONSTRAINT type_of_crime_name_nn NOT NULL
);