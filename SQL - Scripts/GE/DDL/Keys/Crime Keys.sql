-- PRIMARY KEY
ALTER TABLE crime
    ADD CONSTRAINT crime_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE crime
    ADD CONSTRAINT crime_record_fk FOREIGN KEY(record_id) REFERENCES record(id);
    
ALTER TABLE crime
    ADD CONSTRAINT crime_type_fk FOREIGN KEY(type_id) REFERENCES type_of_crime(id);