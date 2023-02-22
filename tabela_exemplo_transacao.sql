-- tabela utilizada no exemplo de transações
-- DROP database transactionExample;

CREATE DATABASE transactionExample;

USE transactionExample;

-- DROP TABLE orders;

CREATE TABLE orders(
    orderNumbers INT AUTO_INCREMENT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    orderStatus ENUM('DESPACHADO','EM PROGRESSO','ENTREGUE'),
    customerNumber INT,
    CONSTRAINT pk_orders PRIMARY KEY (orderNumbers)
);

DESC orders;

CREATE TABLE orderDetails(
    orderNumbers INT AUTO_INCREMENT,
    productCode VARCHAR(255),
    quantifyOrder INT,
    price VARCHAR(255),
    CONSTRAINT fk_orderdetails FOREIGN KEY (orderNumbers) REFERENCES orders(orderNumbers),
    CONSTRAINT pk_orderdetails PRIMARY KEY (orderNumbers, productCode)
);

DESC ordersDetails;

SELECT * FROM ordersDetails;
SELECT * FROM orders;

SELECT * FROM orders JOIN ordersDetails USING(orderNumbers);