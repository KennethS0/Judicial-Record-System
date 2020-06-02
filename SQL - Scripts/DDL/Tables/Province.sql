create table Province
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT province_pk_nn NOT NULL,
       --FOREIGN KEY
       country_id  NUMBER(6) CONSTRAINT province_countryID_nn NOT NULL,
       --ATTRIBUTES
       name VARCHAR2(20) CONSTRAINT province_name NOT NULL

);