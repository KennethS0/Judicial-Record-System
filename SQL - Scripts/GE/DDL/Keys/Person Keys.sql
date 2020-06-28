-- PRIMARY KEYS
ALTER TABLE person
    ADD CONSTRAINT person_id_pk PRIMARY KEY(citizenship_id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE person
    ADD CONSTRAINT person_gender_fk FOREIGN KEY(gender_id) REFERENCES gender(id);

ALTER TABLE person
    ADD CONSTRAINT person_address_fk FOREIGN KEY(address_id) REFERENCES address(id);
    
ALTER TABLE person
    ADD CONSTRAINT person_user_fk FOREIGN KEY(user_id) REFERENCES useraccount(id);
    
