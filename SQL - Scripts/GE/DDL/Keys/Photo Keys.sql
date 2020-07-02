-- PRIMARY KEY
ALTER TABLE photo
    ADD CONSTRAINT photo_id_pk PRIMARY KEY(id)
    USING INDEX
    TABLESPACE ge_index PCTFREE 20
    STORAGE (INITIAL 10k NEXT 10k PCTINCREASE 0);
    
-- FOREIGN KEY
ALTER TABLE photo
    ADD CONSTRAINT photo_record_fk FOREIGN KEY(record_id) REFERENCES record(id);
    --Hay que cambiar PHOTO.RECORD_ID a NUMBER para que coincida con ID de RECORD