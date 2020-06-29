CREATE TABLE passwordhistory
(
    -- PRIMARY KEY
    id              NUMBER(6) CONSTRAINT password_pk_nn NOT NULL,
    -- FOREIGN KEY
    
    -- ATTRIBUTES
    new_password    VARCHAR2(64) CONSTRAINT password_newpassword_nn NOT NULL,
    user_id         NUMBER(6) CONSTRAINT user_id NOT NULL
);