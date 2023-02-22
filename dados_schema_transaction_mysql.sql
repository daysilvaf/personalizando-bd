SHOW databases;

USE transactionexemple;
DROP DATABASE transactionexemple;
SHOW tables;

USE performance_schema;
SHOW tables;

SELECT * FROM accounts;
SELECT @@autocommit;
SET @@autocommit; = OFF;

SELECT * FROM performance_schema.events_transactions_summary_global_by_event_name LIMIT 1;