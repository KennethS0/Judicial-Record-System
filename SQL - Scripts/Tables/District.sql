create table District
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT district_pk_nn NOT NULL,
       --FOREIGN KEY
       canton_id  NUMBER(6) CONSTRAINT district_cantonID_nn NOT NULL,
       --ATTRIBUTES
       name VARCHAR2(20) CONSTRAINT district_name NOT NULL

);