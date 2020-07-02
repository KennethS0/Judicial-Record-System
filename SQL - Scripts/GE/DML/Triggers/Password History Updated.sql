CREATE OR REPLACE TRIGGER update_password_data
AFTER INSERT OR UPDATE OF password ON ge.useraccount
FOR EACH ROW
BEGIN
-- INSERTS THE NEW PASSWORD INTO THE HISTORY WITH ITS USER ID
    INSERT INTO ad.passwordhistory (new_password, user_id)
    VALUES (:new.password, :new.id);
    
-- UPDATES THE PASSWORD IN THE ADMINISTRATOR TABLE
    UPDATE administrator a
    SET a.password = :new.password
    WHERE :old.id = a.user_id;
END;
