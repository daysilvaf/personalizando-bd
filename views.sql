SHOW databases;
USE transactionexample;

-- drop view [if exists] [database_name].[view_name]
DROP VIEW IF EXISTS v_today;

-- to create a view
CREATE VIEW v_today AS SELECT current_date;

-- para alterar a visualização com replace, usamos o seguinte comando
CREATE OR REPLACE VIEW v_today (today) AS SELECT current_date();

-- podemos utilizar alter table para modificações nas views
ALTER VIEW v_today AS SELECT current_date();

SELECT * FROM v_today;

-- descobrir quais colunas estão disponíveis na view
DESCRIBE v_today;