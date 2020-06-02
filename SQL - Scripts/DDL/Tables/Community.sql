create table Community
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT community_pk_nn NOT NULL,
       --FOREIGN KEY
       district_id  NUMBER(6) CONSTRAINT community_districtID_nn NOT NULL,
       --ATTRIBUTES
       name VARCHAR2(20) CONSTRAINT community_name NOT NULL

);