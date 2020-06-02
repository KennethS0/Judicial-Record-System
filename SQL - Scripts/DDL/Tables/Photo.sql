CREATE TABLE photo
(
-- PRIMARY KEY
    id          number(10) CONSTRAINT photo_id_nn NOT NULL,
-- FOREIGN KEY
    record_id   VARCHAR(6) CONSTRAINT photo_record_nn NOT NULL,
-- ATTRIBUTE
    photo_path  VARCHAR(100) CONSTRAINT photo_path_nn NOT NULL
);  