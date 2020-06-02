-- PRIMARY KEYS
ALTER TABLE useraccount
    ADD CONSTRAINT user_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE useraccount
    ADD CONSTRAINT user_history_fk FOREIGN KEY(password_history_id) REFERENCES passwordhistory(id);
