CREATE TABLE ban
(
    -- PRIMARY KEY
    id              NUMBER(6) CONSTRAINT ban_pk_nn NOT NULL,
    
    -- FOREIGN KEY
    User_id         NUMBER(6) CONSTRAINT ban_UserID_nn NOT NULL,
    
    -- ATTRIBUTES
    description_    VARCHAR2(20) CONSTRAINT ban_description_nn NOT NULL,
    isPermanent     NUMBER(1) CONSTRAINT ban_permanent_nn NOT NULL, -- TAKEN AS A BOOLEAN
    date_commited   DATE DEFAULT SYSDATE CONSTRAINT ban_creationdate_nn NOT NULL,
    unban_date      DATE
);