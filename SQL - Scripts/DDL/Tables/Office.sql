create table Office
(
       --PRIMARY KEY
       id NUMBER(4) CONSTRAINT Office_pk_nn NOT NULL,
       --FOREIGN KEY

       --ATTRIBUTES
       name VARCHAR2(25) CONSTRAINT office_name_nn NOT NULL,
       subject_code VARCHAR(2) CONSTRAINT office_subject_code NOT NULL
);