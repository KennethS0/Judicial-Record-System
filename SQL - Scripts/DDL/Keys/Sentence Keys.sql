-- PRIMARY KEYS
ALTER TABLE sentence
    ADD CONSTRAINT sentence_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEYS
ALTER TABLE sentence
    ADD CONSTRAINT sentence_type_fk FOREIGN KEY(type_of_sentence_id) REFERENCES type_of_sentence(id);
