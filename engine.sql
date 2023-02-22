SHOW ENGINES; 

SELECT ENGINE FROM information_schema.tables
WHERE table_schema = 'transactionExample';

SELECT * FROM information_schema.tables
WHERE table_schema = 'transactionExample' AND table_name = 'orders';