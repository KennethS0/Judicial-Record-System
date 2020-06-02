CREATE TABLE passwordhistory
(
    -- PRIMARY KEY
    id              NUMBER(6) CONSTRAINT password_pk_nn NOT NULL,
    
    -- FOREIGN KEY
    
    -- ATTRIBUTES
    new_password    VARCHAR2(20) CONSTRAINT password_newpassword_nn NOT NULL,
    creation_date   DATE DEFAULT SYSDATE CONSTRAINT password_creationdate_nn NOT NULL
);