CREATE OR REPLACE TRIGGER passwordhistory_updated
BEFORE UPDATE
ON passwordhistory
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER parameter_updated
BEFORE UPDATE
ON parameter
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/