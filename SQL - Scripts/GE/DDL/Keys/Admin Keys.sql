-- PRIMARY KEYS
ALTER TABLE administrator
    ADD CONSTRAINT admin_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE administrator
    ADD CONSTRAINT admin_user_fk FOREIGN KEY(user_id) REFERENCES useraccount(id);