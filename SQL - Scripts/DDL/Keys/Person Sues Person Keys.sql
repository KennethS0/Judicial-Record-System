-- PRIMARY KEY
ALTER TABLE person_sues_person
    ADD CONSTRAINT sue_id_pk PRIMARY KEY(id, defendant, prosecutor)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE person_sues_person
    ADD CONSTRAINT sue_defendant_fk FOREIGN KEY(defendant) REFERENCES person(citizenship_id);

ALTER TABLE person_sues_person
    ADD CONSTRAINT sue_prosecutor_fk FOREIGN KEY(prosecutor) REFERENCES person(citizenship_id);