create table Address
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT address_pk_nn NOT NULL,
       --FOREIGN KEY
       community_id  NUMBER(6) CONSTRAINT address_commID_nn NOT NULL,
       --ATTRIBUTES
       description_ VARCHAR2(100) CONSTRAINT address_descript_nn NOT NULL

);