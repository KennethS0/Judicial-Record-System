CREATE OR REPLACE TRIGGER passwordhistory_updated
BEFORE UPDATE
ON passwordhistory
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/