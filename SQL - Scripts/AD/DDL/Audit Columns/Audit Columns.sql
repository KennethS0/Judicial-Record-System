ALTER TABLE passwordhistory
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT passhistory_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT passhistory_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        modification_date DATE
        );
