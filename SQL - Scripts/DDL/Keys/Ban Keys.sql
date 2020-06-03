-- PRIMARY KEY
ALTER TABLE ban
    ADD CONSTRAINT ban_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE ban
    ADD CONSTRAINT ban_user_fk FOREIGN KEY(user_id) REFERENCES useraccount(id);