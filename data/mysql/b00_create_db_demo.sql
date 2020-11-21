create database demo;

GRANT  SELECT, INSERT, UPDATE, DELETE ON demo.* TO connect_user;
SET GLOBAL binlog_format = 'ROW';
SET GLOBAL binlog_row_image = 'FULL';
SET GLOBAL expire_logs_days  = 10;

