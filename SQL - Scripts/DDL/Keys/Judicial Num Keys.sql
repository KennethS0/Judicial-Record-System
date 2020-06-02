-- PRIMARY KEYS
ALTER TABLE judicial_num
    ADD CONSTRAINT judicial_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE judicial_num
    ADD CONSTRAINT judicial_circuit_fk FOREIGN KEY(judicial_circuit_id) REFERENCES judicial_circuit(id);
