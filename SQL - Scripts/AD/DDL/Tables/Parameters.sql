CREATE TABLE parameter 
(
    id NUMBER(6) CONSTRAINT parameter_id_nn NOT NULL,
    name VARCHAR2(20) CONSTRAINT parameter_name_nn NOT NULL,
    value VARCHAR(30) CONSTRAINT parameter_value_nn NOT NULL
);