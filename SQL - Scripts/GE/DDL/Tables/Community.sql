create table Community
(
       --PRIMARY KEY
       id NUMBER(7) CONSTRAINT community_pk_nn NOT NULL,
       --FOREIGN KEY
       district_id  NUMBER(6) CONSTRAINT community_districtID_nn NOT NULL,
       --ATTRIBUTES
       name VARCHAR2(40) CONSTRAINT community_name NOT NULL

);