CREATE TABLE person
(
    -- PRIMARY KEY
    citizenship_id  NUMBER(10) CONSTRAINT person_pk_nn NOT NULL,
    
    -- FOREIGN KEY
    Gender_id       NUMBER(1) CONSTRAINT person_gender_nn NOT NULL,
    Address_id      NUMBER(6) CONSTRAINT person_address_nn NOT NULL,
    User_id         NUMBER(6),
    
    -- ATTRIBUTES
    institution     VARCHAR2(20), -- NULLABLE
    first_name      VARCHAR2(20) CONSTRAINT person_firstname_nn NOT NULL,
    middle_name     VARCHAR2(20), -- NULLABLE
    last_name       VARCHAR2(20) CONSTRAINT person_lastname_nn NOT NULL,
    secondlast_name VARCHAR2(20) CONSTRAINT person_slastname_nn NOT NULL,
    birth_date      DATE CONSTRAINT person_birthdate_nn NOT NULL
);