# FUNÇÕES DE AGREGAÇÃO

# COUNT, COUNT(*) e COUNT(DISTINCT)
-- Funções que realizam contagens de valores nas nossas tabelas

-- A estrutura será:
-- SELECT
-- COUNT(Coluna) AS 'Contagem'
-- FROM Tabela

# 1. COUNT
-- a) Conte a quantidade de clientes a partir da coluna de Nome
SELECT 
	COUNT(Nome) AS 'QDT'
FROM clientes;

-- b) Conte a quantidade de clientes a partir da coluna de Telefone
SELECT 
	COUNT(Telefone) AS 'QDT'
FROM clientes;

# 2. COUNT(*)
-- c) Houve alguma diferença nos resultados? Por quê?
-- Teve diferença pq o count ignora os valores nulos
SELECT 
	COUNT(*) AS 'QDT'
FROM clientes;

# COUNT(DISTINCT)
-- Conte a quantidade de marcas distintas na tabela de PRODUTOS
SELECT
	COUNT(DISTINCT Marca_Produto)
FROM produtos;

