-- PRIMARY KEYS
ALTER TABLE judicial_circuit
    ADD CONSTRAINT circuit_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE judicial_circuit
    ADD CONSTRAINT circuit_canton_fk FOREIGN KEY(canton_id) REFERENCES canton(id);