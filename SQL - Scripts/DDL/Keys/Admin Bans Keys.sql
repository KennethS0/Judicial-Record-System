-- PRIMARY KEY
ALTER TABLE adminbans
    ADD CONSTRAINT adminbans_id_pk PRIMARY KEY(admin_id, ban_id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE adminbans
    ADD CONSTRAINT adminbans_admin_fk FOREIGN KEY(admin_id) REFERENCES administrator(id);
    
ALTER TABLE adminbans
    ADD CONSTRAINT adminbans_ban_fk FOREIGN KEY(ban_id) REFERENCES ban(id);