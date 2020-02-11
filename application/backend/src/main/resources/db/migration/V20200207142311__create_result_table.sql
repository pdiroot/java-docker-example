CREATE TABLE IF NOT EXISTS result
(
    ip_address varchar(45) NOT NULL,
    result     integer     NOT NULL,
    time_stamp timestamp   NOT NULL,
    id SERIAL,
    PRIMARY KEY (id)
)