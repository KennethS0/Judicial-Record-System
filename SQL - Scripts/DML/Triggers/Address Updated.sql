CREATE OR REPLACE TRIGGER address_updated
BEFORE UPDATE
ON address
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/