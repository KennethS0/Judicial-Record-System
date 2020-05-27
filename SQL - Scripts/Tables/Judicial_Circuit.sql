create table Judicial_Circuit
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT judicial_Circ_pk_nn NOT NULL,
       --FOREIGN KEY
       canton_ID  NUMBER(6) CONSTRAINT judicial_canton_nn NOT NULL,
       office_ID  NUMBER(6) CONSTRAINT judicial_office_nn NOT NULL,
       --ATTRIBUTES
       description_ VARCHAR2(20) CONSTRAINT judicial_descript_nn NOT NULL

);