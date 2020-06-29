create table Canton
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT canton_pk_nn NOT NULL,
       --FOREIGN KEY
       province_id  NUMBER(6) CONSTRAINT canton_districtID_nn NOT NULL,
       --ATTRIBUTES
       name VARCHAR2(20) CONSTRAINT canton_name NOT NULL

);