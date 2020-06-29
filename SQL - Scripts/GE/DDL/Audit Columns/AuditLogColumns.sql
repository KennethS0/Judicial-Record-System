-- ADDITION OF AUDIT LOG COLUMNS TO EVERY TABLE
ALTER TABLE address
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT address_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT address_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE adminbans
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT adminbans_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT adminbans_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE administrator
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT admin_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT admin_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE ban
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT ban_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT ban_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE canton
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT canton_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT canton_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE community
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT community_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT community_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE country
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT country_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT country_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE crime
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT crime_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT crime_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE district
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT district_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT district_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );

ALTER TABLE gender
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT gender_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT gender_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE judicial_circuit
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT judicial_circuit_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT judicial_circuit_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE judicial_num
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT judicial_num_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT judicial_num_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE office
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT office_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT office_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE person
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT person_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT person_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE person_sues_person
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT person_sues_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT person_sues_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE photo
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT photo_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT photo_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE province
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT province_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT province_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE record
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT record_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT record_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE resolution
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT resolution_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT resolution_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE sentence
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT sentence_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT sentence_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );

ALTER TABLE type_of_crime
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT type_crime_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT type_crime_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );        
        
ALTER TABLE type_of_record
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT type_record_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT type_record_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE type_of_sentence
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT type_sentence_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT type_sentence_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );
        
ALTER TABLE useraccount
    ADD (
        creation_user VARCHAR2(10) CONSTRAINT useraccount_c_user_nn NOT NULL,
        creation_date DATE DEFAULT SYSDATE CONSTRAINT useraccount_c_date_nn NOT NULL,
        modification_user VARCHAR2(10),
        MODIFICATION_DATE DATE
        );