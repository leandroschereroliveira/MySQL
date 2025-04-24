-- ALTER VIEW: Altera uma view existente no banco de dados.alter

ALTER VIEW vwclientes AS
SELECT
	ID_Cliente,
    Nome,
    Email,
    Telefone,
    Escolaridade
FROM clientes
WHERE Escolaridade = 'Parcial';


SELECT * FROM vwclientes;

-- DROP VIEW: Exclui uma view de um banco de dados.
DROP VIEW vwclientes;
