USE company_constraints;

show INDEX FROM employee; 

/*Suponha que o campo email é muito acessado
Pode ser criado uma index para este campo (atributo)*/

--secure-file-priv option 
-- select * from employee into outfile "/tmp/fileselect.txt"; 

CREATE DATABASE IF NOT EXISTS customer_managment; 
USE customer_managment; 

CREATE TABLE IF NOT EXISTS customer(
    id_customer INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(25),
    email VARCHAR(40),
    CPF CHAR(9),
    credit_card CHAR(13),
    contact CHAR(9),
    address VARCHAR(30)
);

SHOW INDEX FROM customer;

ALTER TABLE customer ADD index idx_email (email);

CREATE TABLE customer(
customer_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
store_id TINYINT UNSIGNED NOT NULL, 
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
email VARCHAR(50) DEFAULT NULL,
address_id SMALL INT UNSIGNED NOT NULL,
active BOOLEAN NOT NULL DEFAULT TRUE,
create_date DATETIME NOT NULL,
last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (customer_id),
KEY idx_fk_store_id (store_id),
KEY idx_fk_address_id (address_id),
KEY idx_last_name (last_name)
);

ALTER TABLE customer DROP INDEX idx_email;

-- Unique index

ALTER TABLE customer ADD UNIQUE idx_email (email);
ALTER TABLE customer ADD PRIMARY KEY idx_email (email);

-- Multicolumn index

ALTER TABLE customer ADD INDEX idx_full_name (last_name, first_name); 

explain 

SELECT customer_id, first_name, last_name

FROM customer

WHERE first_name LIKE 'S%' AND last_name LIKE 'P%'; 