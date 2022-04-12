CREATE DATABASE deb;
GO

USE deb;
GO

EXEC sys.sp_cdc_enable_db;
GO

DROP TABLE IF EXISTS sqlserver_types;
GO

CREATE TABLE sqlserver_types (
    t_null VARCHAR(2),
    t_bigint BIGINT,
    t_int INT,
    t_smallint SMALLINT,
    t_tinyint TINYINT,
    t_float FLOAT,
    t_real REAL,
    t_decimal DECIMAL(5, 2),
    t_numeric NUMERIC(10, 5),
    t_bit BIT,
    t_smallmoney SMALLMONEY,
    t_money MONEY,
    t_char CHAR(10),
    t_varchar VARCHAR(10),
    t_nchar NCHAR(10),
    t_nvarchar NVARCHAR(10),
    t_text TEXT,
    t_ntext NTEXT,
    t_time TIME,
    t_date DATE,
    t_smalldatetime SMALLDATETIME,
    t_datetime DATETIME,
    t_datetime2 DATETIME2,
    t_datetimeoffset DATETIMEOFFSET,
);
GO

INSERT INTO sqlserver_types
(
    t_null,
    t_bigint,
    t_int,
    t_smallint,
    t_tinyint,
    t_float,
    t_real,
    t_decimal,
    t_numeric,
    t_bit,
    t_smallmoney,
    t_money,
    t_char,
    t_varchar,
    t_nchar,
    t_nvarchar,
    t_text,
    t_ntext,
    t_time,
    t_date,
    t_smalldatetime,
    t_datetime,
    t_datetime2,
    t_datetimeoffset
)
VALUES
(
    NULL,
    1,
    2147483647,
    32767,
    255,
    12345.12345,
    12345.12345,
    123.456,
    12345.12345,
    1,
    3148.2929,
    3148.1234,
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    '12:35:29.1234567',
    '2007-05-08',
    '2007-05-08 12:35:00',
    '2007-05-08 12:35:29.123',
    '2007-05-08 12:35:29.1234567',
    '2007-05-08 12:35:29.1234567 +12:15'
);
GO


INSERT INTO sqlserver_types
(
    t_null,
    t_bigint,
    t_int,
    t_smallint,
    t_tinyint,
    t_float,
    t_real,
    t_decimal,
    t_numeric,
    t_bit,
    t_smallmoney,
    t_money,
    t_char,
    t_varchar,
    t_nchar,
    t_nvarchar,
    t_text,
    t_ntext,
    t_time,
    t_date,
    t_smalldatetime,
    t_datetime,
    t_datetime2,
    t_datetimeoffset
)
VALUES
(
    NULL,
    9223372036854775807,
    2147483647,
    32767,
    255,
    12345.12345,
    12345.12345,
    123.456,
    12345.12345,
    1,
    3148.2929,
    3148.1234,
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    '12:35:29.1234567',
    '2007-05-08',
    '2007-05-08 12:35:00',
    '2007-05-08 12:35:29.123',
    '2007-05-08 12:35:29.1234567',
    '2007-05-08 12:35:29.1234567 +12:15'
);
GO

INSERT INTO sqlserver_types
(
    t_null,
    t_bigint,
    t_int,
    t_smallint,
    t_tinyint,
    t_float,
    t_real,
    t_decimal,
    t_numeric,
    t_bit,
    t_smallmoney,
    t_money,
    t_char,
    t_varchar,
    t_nchar,
    t_nvarchar,
    t_text,
    t_ntext,
    t_time,
    t_date,
    t_smalldatetime,
    t_datetime,
    t_datetime2,
    t_datetimeoffset
)
VALUES
(
    NULL,
    9223372036854775807,
    2147483647,
    32767,
    255,
    12345.12345,
    12345.12345,
    123.456,
    12345.12345,
    1,
    3148.2929,
    3148.1234,
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    '12:35:29.1234567',
    '2007-05-08',
    '2007-05-08 12:35:00',
    '2007-05-08 12:35:29.123',
    '2007-05-08 12:35:29.1234567',
    '2007-05-08 12:35:29.1234567 +12:15'
);
GO


DELETE FROM sqlserver_types
WHERE t_bigint = 1;
GO
