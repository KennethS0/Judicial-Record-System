CREATE OR REPLACE TRIGGER adminbans_updated
BEFORE UPDATE
ON ADMINBANS
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/