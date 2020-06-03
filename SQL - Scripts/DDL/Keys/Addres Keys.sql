-- PRIMARY KEY
ALTER TABLE address
    ADD CONSTRAINT adress_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE address
    ADD CONSTRAINT address_community_fk FOREIGN KEY(community_id) REFERENCES community(id);