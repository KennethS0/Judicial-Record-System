-- PRIMARY KEYS
ALTER TABLE record
    ADD CONSTRAINT record_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE record
    ADD CONSTRAINT record_resolution_fk FOREIGN KEY(resolution_id) REFERENCES resolution(id);
    
ALTER TABLE record
    ADD CONSTRAINT record_type_fk FOREIGN KEY(type_id) REFERENCES type_of_record(id);
    
ALTER TABLE record
    ADD CONSTRAINT record_user_fk FOREIGN KEY(user_id) REFERENCES useraccount(id);
    
ALTER TABLE record
    ADD CONSTRAINT record_person_fk FOREIGN KEY(person_id) REFERENCES person(citizenship_id);
    
ALTER TABLE record
    ADD CONSTRAINT record_number_fk FOREIGN KEY(number_id) REFERENCES judicial_num(id);
    