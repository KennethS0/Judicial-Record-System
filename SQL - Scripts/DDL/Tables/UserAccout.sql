CREATE TABLE UserAccount
(
    -- PRIMARY KEY
    id                  NUMBER(6) CONSTRAINT user_pk_nn NOT NULL,
    
    -- FOREIGN KEY
    Password_History_ID NUMBER(6) CONSTRAINT user_passhistory_nn NOT NULL,
    
    -- ATTRIBUTES
    username            VARCHAR2(20) CONSTRAINT user_username_nn NOT NULL,
    password            VARCHAR2(20) CONSTRAINT user_password_nn NOT NULL,
    creation_date       DATE DEFAULT SYSDATE CONSTRAINT user_creationdate_nn NOT NULL
);