-- PRIMARY KEYS
ALTER TABLE resolution
    ADD CONSTRAINT resolution_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE resolution
    ADD CONSTRAINT resolution_sentence_fk FOREIGN KEY(sentence_id) REFERENCES sentence(id);
