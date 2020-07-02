-- PRIMARY KEYS
ALTER TABLE office
    ADD CONSTRAINT office_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE office
    ADD CONSTRAINT office_circuit_fk FOREIGN KEY(judicial_circuit_id) REFERENCES judicial_circuit(id);
