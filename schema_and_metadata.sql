USE company_constraints;
SHOW TABLES;
SHOW INDEX FROM employee;
USE information_schema;
USE mysql;
SHOW TABLES;
SELECT user FROM mysql;
SHOW DATABASES;

SELECT * FROM user;
CREATE DATABASE testuser;

CREATE USER 'geral'@localhost identified by '123456798';
GRANT all privilegies ON testuser.* to 'geral'@localhost; 
/*
grant all privileges on testuser.* to 'geral'@localhost; 
grant all privileges on testuser.table to 'geral'@localhost; 
grant all privileges on *.* to 'geral'@localhost; 
*/
flush privileges;