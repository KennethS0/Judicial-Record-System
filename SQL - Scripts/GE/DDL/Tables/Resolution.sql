create table Resolution
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT resolution_pk_nn NOT NULL,
       --FOREIGN KEY
       Sentence_id NUMBER(6) CONSTRAINT resolution_senID_nn NOT NULL,
       --ATTRIBUTES
       resolution_date DATE CONSTRAINT resolution_date_nn NOT NULL,
       description_ VARCHAR2(300) CONSTRAINT resolution_description_nn NOT NULL

);