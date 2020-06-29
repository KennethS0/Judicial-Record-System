create table Office
(
       --PRIMARY KEY
       id NUMBER(4) CONSTRAINT Office_pk_nn NOT NULL,
       --FOREIGN KEY
        judicial_circuit_id NUMBER(6) CONSTRAINT office_circuit_id_nn NOT NULL,


       --ATTRIBUTES
       name VARCHAR2(250) CONSTRAINT office_name_nn NOT NULL,
       subject_code VARCHAR(2) CONSTRAINT office_subject_code NOT NULL
);