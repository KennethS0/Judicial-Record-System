-- PRIMARY KEY
ALTER TABLE community
    ADD CONSTRAINT community_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE community
    ADD CONSTRAINT community_district_fk FOREIGN KEY(district_id) REFERENCES district(id);