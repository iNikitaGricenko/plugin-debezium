USE kestra;

DROP TABLE IF EXISTS mysql_types;

CREATE TABLE mysql_types (
    concert_id SERIAL,
    available TINYINT not null,
    a CHAR(4) not null,
    b VARCHAR(30) not null,
    c TEXT not null,
    d VARCHAR(10),
    play_time BIGINT not null,
    library_record BIGINT not null,
    bitn_test BIT(6) not null,
    floatn_test FLOAT not null,
    double_test DOUBLE not null,
    doublen_test DOUBLE(18,4) not null,
    numeric_test NUMERIC(3,2) not null,
    salary_decimal DECIMAL(5,2),
    date_type DATE not null,
    datetime_type DATETIME(6) not null,
    time_type TIME not null,
    timestamp_type TIMESTAMP(6) not null,
    year_type YEAR(4) not null,
    json_type JSON not null,
    blob_type BLOB not null,
    PRIMARY KEY (concert_id)
);


-- Insert
INSERT INTO mysql_types
(
    concert_id,
    available,
    a,
    b,
    c,
    d,
    play_time,
    library_record,
    bitn_test,
    floatn_test,
    double_test,
    doublen_test,
    numeric_test,
    salary_decimal,
    date_type,
    datetime_type,
    time_type,
    timestamp_type,
    year_type,
    json_type,
    blob_type
)
VALUES
(
    DEFAULT,
    true,
    'four',
    'This is a varchar',
    'This is a text column data',
    NULL,
    -9223372036854775808,
    1844674407370955161,
    b'000101',
    9223372036854776000,
    9223372036854776000,
    2147483645.1234,
    5.36,
    999.99,
    '2030-12-25',
    '2050-12-31 22:59:57.150150',
    '04:05:30',
    '2004-10-19 10:23:54.999999',
    '2025',
    '{"color":"red","value":"#f00"}',
    x'DEADBEEF'
);



-- Insert
INSERT INTO mysql_types
(
    concert_id,
    available,
    a,
    b,
    c,
    d,
    play_time,
    library_record,
    bitn_test,
    floatn_test,
    double_test,
    doublen_test,
    numeric_test,
    salary_decimal,
    date_type,
    datetime_type,
    time_type,
    timestamp_type,
    year_type,
    json_type,
    blob_type
)
VALUES
(
    DEFAULT,
    true,
    'four',
    'This is a varchar',
    'This is a text column data',
    NULL,
    -9223372036854775808,
    1844674407370955161,
    b'000101',
    9223372036854776000,
    9223372036854776000,
    2147483645.1234,
    5.36,
    999.99,
    '2030-12-25',
    '2050-12-31 22:59:57.150150',
    '04:05:30',
    '2004-10-19 10:23:54.999999',
    '2025',
    '{"color":"red","value":"#f00"}',
    x'DEADBEEF'
);


-- Insert
INSERT INTO mysql_types
(
    concert_id,
    available,
    a,
    b,
    c,
    d,
    play_time,
    library_record,
    bitn_test,
    floatn_test,
    double_test,
    doublen_test,
    numeric_test,
    salary_decimal,
    date_type,
    datetime_type,
    time_type,
    timestamp_type,
    year_type,
    json_type,
    blob_type
)
VALUES
(
    DEFAULT,
    true,
    'four',
    'This is a varchar',
    'This is a text column data',
    NULL,
    -9223372036854775808,
    1844674407370955161,
    b'000101',
    9223372036854776000,
    9223372036854776000,
    2147483645.1234,
    5.36,
    999.99,
    '2030-12-25',
    '2050-12-31 22:59:57.150150',
    '04:05:30',
    '2004-10-19 10:23:54.999999',
    '2025',
    '{"color":"red","value":"#f00"}',
    x'DEADBEEF'
);

-- Update
UPDATE mysql_types SET numeric_test = 6.36  WHERE concert_id = 2;

-- Delete
DELETE FROM mysql_types WHERE concert_id = 1;


CREATE DATABASE second;
USE second;


CREATE TABLE EmployeeTerritory (
    employeeId INT AUTO_INCREMENT NOT NULL,
    territoryId VARCHAR(20) NOT NULL,
    PRIMARY KEY (employeeId, territoryId)
) ENGINE=INNODB;


INSERT INTO EmployeeTerritory  VALUES (1,'06897');
INSERT INTO EmployeeTerritory  VALUES (1,'19713');
INSERT INTO EmployeeTerritory  VALUES (2,'01581');
INSERT INTO EmployeeTerritory  VALUES (2,'01730');
INSERT INTO EmployeeTerritory  VALUES (2,'01833');
INSERT INTO EmployeeTerritory  VALUES (2,'02116');
INSERT INTO EmployeeTerritory  VALUES (2,'02139');


DELETE FROM EmployeeTerritory;
