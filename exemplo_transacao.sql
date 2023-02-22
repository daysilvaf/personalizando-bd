-- Exemplo com transações
-- Sem determinar o rollback explicitamente ele não acontece
SET @@autocommit = OFF;

-- Startando uma transação
START TRANSACTION;

-- Query SQL recuperando o ID de order
SELECT 

-- Declarando uma variável com @
@orderNumber:=max(orderNumbers)+1
FROM
orders;

-- Inserção de dados em order
INSERT INTO orders(orderNumbers,
orderDate,
requiredDate,
shippedDate,
orderStatus
)

VALUES(@orderNumber,
'2005-05-31',
'2005-6-10',
'2005-06-11',
'EM PROGRESSO'
);

SAVE POINT insercao_em_order;

SELECT 

-- Declarando uma variável com @
@orderNumber:=max(orderNumbers)
FROM 
orders;

-- Inserindo linhas de order
INSERT INTO ordersDetails(orderNumbers,
productCode,
quantityOrder,
price
)

VALUES(@orderNumber,181749, 30, '136'),
(@orderNumber,182248, 50, '55.09'); 

SAVE POINT insercao_em_orderdetails;

-- Comitando as modificações 
COMMIT;

-- Rollback to savepoint insercao_em_order;
ROLLBACK;
