CREATE OR REPLACE TRIGGER passwordhistory_inserted
BEFORE INSERT
ON passwordhistory
FOR EACH ROW
BEGIN
    :new.id := ad.passwordhistory_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER parameter_inserted
BEFORE INSERT
ON parameter
FOR EACH ROW
BEGIN
    :new.id := ad.parameter_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/