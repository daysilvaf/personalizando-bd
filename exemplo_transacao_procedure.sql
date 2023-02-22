DROP PROCEDURE insercao_de_dados;

CALL insercao_de_dados;

DELIMITER //
CREATE PROCEDURE insercao_de_dados()
BEGIN

-- declarando variável de controle do procedimento
DECLARE erro_sql TINYINT DEFAULT false;

-- declarando o handler de exceções sql e setando erro_sql = true

DECLARE CONTINUE handler for sqlexception SET erro_sql = true;

START TRANSACTION;
UPDATE transactionExample.orders SET orderStatus = 'ENTREGUE' WHERE orderNumbers = 3;

IF erro_sql = false THEN
COMMIT;
SELECT * FROM orders WHERE orderNumber = 2;
ELSE 
ROLLBACK;
SELECT 'Erro na transação' AS Resultado;
END IF;
END//