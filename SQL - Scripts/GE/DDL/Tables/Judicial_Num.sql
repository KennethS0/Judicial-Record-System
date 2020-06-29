create table Judicial_Num
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT judicial_pk_nn NOT NULL,
       --FOREIGN KEY
       office_id NUMBER(6)CONSTRAINT office_nn NOT NULL,
       --ATTRIBUTES
       consecutive NUMBER(6) CONSTRAINT judicial_consec_nn NOT NULL,
       year NUMBER(2) CONSTRAINT judicial_year_nn NOT NULL

);