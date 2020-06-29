CREATE TABLE AdminBans
(
    -- PRIMARY KEY & FOREIGN KEY
    admin_id              NUMBER(6) CONSTRAINT adban_adminid_nn NOT NULL,
    ban_id                NUMBER(6) CONSTRAINT adban_banid_nn NOT NULL
);