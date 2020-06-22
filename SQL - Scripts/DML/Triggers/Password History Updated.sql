CREATE OR REPLACE TRIGGER update_password_data
AFTER UPDATE OR INSERT
ON useraccount
FOR EACH ROW
BEGIN
    INSERT INTO passwordhistory (new_password, user_id)
    VALUES (:new.password, :new.id);
END;
