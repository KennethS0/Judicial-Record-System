CREATE TABLE administrator
(
    -- PRIMARY KEY
    id              NUMBER(6) CONSTRAINT administrator_pk_nn NOT NULL,
    
    -- FOREIGN KEY
    User_id         NUMBER(10) CONSTRAINT administrator_UserID_nn NOT NULL,
    
    -- ATTRIBUTES
    username        VARCHAR2(20) CONSTRAINT administrator_username_nn NOT NULL,
    password        VARCHAR2(64) CONSTRAINT administrator_password_nn NOT NULL
);