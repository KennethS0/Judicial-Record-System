CREATE TABLE person_sues_person
(
    -- PRIMARY KEY
    id            NUMBER(6) CONSTRAINT sue_id_nn NOT NULL,
    -- PRIMARY KEY & FOREIGN KEY
    defendant     NUMBER(10) CONSTRAINT sue_defendant_nn NOT NULL,
    prosecutor    NUMBER(10) CONSTRAINT sue_prosecutor_nn NOT NULL,
    
    -- ATTRIBUTES
    date_submitted DATE CONSTRAINT sue_date_nn NOT NULL,
    reason        VARCHAR2(300) CONSTRAINT sue_reason_nn NOT NULL
);