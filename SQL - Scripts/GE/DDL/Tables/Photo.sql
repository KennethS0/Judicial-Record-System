CREATE TABLE photo
(
-- PRIMARY KEY
    id          number(10) CONSTRAINT photo_id_nn NOT NULL,
-- FOREIGN KEY
    record_id   NUMBER(6) CONSTRAINT photo_record_nn NOT NULL,
-- ATTRIBUTE
    photo BLOB CONSTRAINT photo_nn NOT NULL
);  