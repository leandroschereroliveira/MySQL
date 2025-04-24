#View no MySQL
-- Criando, alterando e excluindo uma View.

-- CREATE VIEW: Cria uma view no nosso banco de dados.
SELECT * FROM clientes;

CREATE VIEW vwclientes AS
SELECT 
	ID_Cliente,
    Nome,
    Data_Nascimento,
    Email,
    Telefone
FROM clientes; 


SELECT * FROM vwclientes;