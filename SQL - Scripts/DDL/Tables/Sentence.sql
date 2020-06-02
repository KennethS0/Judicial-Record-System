create table sentence
(
       --PRIMARY KEY
       id NUMBER(6) CONSTRAINT sentence_pk_nn NOT NULL,
       --FOREIGN KEY
       type_of_sentence_id NUMBER(6) CONSTRAINT sentence_typeID_nn NOT NULL,
       --ATTRIBUTES
       initial_date DATE CONSTRAINT initial_date_nn NOT NULL,
       final_date DATE CONSTRAINT final_date_nn NOT NULL, 
       CONSTRAINT check_dates CHECK(initial_date < final_date)
       --Years NUMBER() ....
);
