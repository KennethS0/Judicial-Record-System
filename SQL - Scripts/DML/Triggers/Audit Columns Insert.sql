CREATE OR REPLACE TRIGGER address_inserted
BEFORE INSERT
ON address
FOR EACH ROW
BEGIN
    :new.id := ge.address_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER adminbans_inserted
BEFORE INSERT
ON adminbans
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER administrator_inserted
BEFORE INSERT
ON administrator
FOR EACH ROW
BEGIN
    :new.id := ge.administrator_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER ban_inserted
BEFORE INSERT
ON ban
FOR EACH ROW
BEGIN
    :new.id := ge.ban_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER canton_inserted
BEFORE INSERT
ON canton
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER community_inserted
BEFORE INSERT
ON community
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER country_inserted
BEFORE INSERT
ON country
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER crime_inserted
BEFORE INSERT
ON crime
FOR EACH ROW
BEGIN
    :new.id := ge.crime_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER district_inserted
BEFORE INSERT
ON district
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER gender_inserted
BEFORE INSERT
ON gender
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER judicial_circuit_inserted
BEFORE INSERT
ON judicial_circuit
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER judicial_num_inserted
BEFORE INSERT
ON judicial_num
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER office_inserted
BEFORE INSERT
ON office
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER passwordhistory_inserted
BEFORE INSERT
ON passwordhistory
FOR EACH ROW
BEGIN
    :new.id := ge.passwordhistory_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER person_inserted
BEFORE INSERT
ON person
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER person_sues_person_inserted
BEFORE INSERT
ON person_sues_person
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER photo_inserted
BEFORE INSERT
ON photo
FOR EACH ROW
BEGIN
    :new.id := ge.photo_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER province_inserted
BEFORE INSERT
ON province
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER record_inserted
BEFORE INSERT
ON record
FOR EACH ROW
BEGIN
    :new.id := ge.record_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER resolution_inserted
BEFORE INSERT
ON resolution
FOR EACH ROW
BEGIN
    :new.id := ge.resolution_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER sentence_inserted
BEFORE INSERT
ON sentence
FOR EACH ROW
BEGIN
    :new.id := ge.sentence_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER type_of_record_inserted
BEFORE INSERT
ON type_of_record
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER type_of_sentence_inserted
BEFORE INSERT
ON type_of_sentence
FOR EACH ROW
BEGIN
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER useraccount_inserted
BEFORE INSERT
ON useraccount
FOR EACH ROW
BEGIN
    :new.id := ge.useraccount_sequence.NEXTVAL;
    :new.creation_user := USER;
    :new.creation_date := SYSDATE;
END;
/