-- PRIMARY KEY
ALTER TABLE district
    ADD CONSTRAINT district_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE district
    ADD CONSTRAINT district_canton_fk FOREIGN KEY(canton_id) REFERENCES canton(id);