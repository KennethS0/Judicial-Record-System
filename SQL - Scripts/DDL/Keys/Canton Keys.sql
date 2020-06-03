-- PRIMARY KEY
ALTER TABLE canton
    ADD CONSTRAINT canton_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE canton
    ADD CONSTRAINT canton_province_fk FOREIGN KEY(province_id) REFERENCES province(id);