CREATE OR REPLACE TRIGGER addess_updated
BEFORE UPDATE
ON address
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER adminbans_updated
BEFORE UPDATE
ON adminbans
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER administrator_updated
BEFORE UPDATE
ON administrator
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER ban_updated
BEFORE UPDATE
ON ban
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER canton_updated
BEFORE UPDATE
ON canton
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER community_updated
BEFORE UPDATE
ON community
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER country_updated
BEFORE UPDATE
ON country
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER crime_updated
BEFORE UPDATE
ON crime
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER district_updated
BEFORE UPDATE
ON district
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER gender_updated
BEFORE UPDATE
ON gender
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER judicial_circuit_updated
BEFORE UPDATE
ON judicial_circuit
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER judicial_num_updated
BEFORE UPDATE
ON judicial_num
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER office_updated
BEFORE UPDATE
ON office
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER person_updated
BEFORE UPDATE
ON person
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER person_sues_person_updated
BEFORE UPDATE
ON person_sues_person
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER photo_updated
BEFORE UPDATE
ON photo
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER province_updated
BEFORE UPDATE
ON province
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER record_updated
BEFORE UPDATE
ON record
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER resolution_updated
BEFORE UPDATE
ON resolution
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER sentence_updated
BEFORE UPDATE
ON sentence
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER type_of_crime_updated
BEFORE UPDATE
ON type_of_crime
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER type_of_record_updated
BEFORE UPDATE
ON type_of_record
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER type_of_sentence_updated
BEFORE UPDATE
ON type_of_sentence
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER useraccount_updated
BEFORE UPDATE
ON useraccount
FOR EACH ROW
BEGIN
    :new.modification_user := USER;
    :new.modification_date := SYSDATE;
END;
/