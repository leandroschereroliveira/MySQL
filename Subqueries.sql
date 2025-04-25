# Subqueries

-- 1. Introdução
-- Podemos resumir uma subquery como sendo um SELECT dentro de outro SELECT, ou seja, uma query dentro de outra query.

-- As subqueries podem ser utilizadas em 3 situações:

-- 1. Subquery como filtro de um nova consulta
	-- Uma subquery pode ser usada para filtrar outras consultas. Para este caso, podemos utilizar as cláusulas WHERE, como os operadores de comparação ( como =, >=, <=), IN e EXISTS.
    
-- Exemplo:
-- SELECT colunas FROM tabela WHERE coluna = (SELECT colunas FROM tabela...); 
    
-- 2. Subquery como uma nova coluna da consulta
	-- Outra utilização de uma subquery é fazer com que o resultado de outra consulta seja uma coluna dentro da sua consulta principal.
    
-- Exemplo:
-- SELECT colunas, (SELECT colunas FROM tabela...) FROM tabela;

-- 3. Subquery como fonte de dados de uma consulta principal
	-- Este outro formato faz com que o resultado de uma subquery possa ser utilizado como tabela fonte de dados de uma consulta principal.

-- Exemplo:
-- SELECT colunas FROM (SELECT colunas FROM tabela...) AS t;

-- Obs.: Necessariamente a tabela resultado da subquery deve ter um apelido (AS).

-- 1. Subquery como filtro de uma nova consulta
-- Exercicio 1. Quais foram os pedidos realizados na loja onde o gerente é o Marcelo Castro?

select * from pedidos;
select * from lojas;
SELECT ID_Loja FROM lojas
WHERE Gerente = 'Marcelo Castro';

SELECT * 
FROM pedidos
WHERE ID_Loja = (
			SELECT ID_Loja 
            FROM lojas
			WHERE Gerente = 'Marcelo Castro'
            );
            
SET @varNomeGerente = 'Marcelo Castro';

SELECT * 
FROM pedidos
WHERE ID_Loja = (
			SELECT ID_Loja 
            FROM lojas
			WHERE Gerente = @varNomeGerente
            );
            
-- Exercicio 2. Quais produtos têm o Preco_Unit acima da média?
SELECT * FROM produtos;
SELECT AVG(Preco_Unit) FROM produtos; -- Média = 1788.125

SELECT * 
FROM produtos
WHERE Preco_Unit > (
				SELECT 
                AVG(Preco_Unit) 
                FROM produtos
                );
                
-- Exercicio 3. Quais produtos são da categoria 'Notebook'?
SELECT * FROM categorias;

SELECT * 
FROM produtos
WHERE ID_Categoria = (
					SELECT 
                    ID_Categoria 
                    FROM categorias 
                    WHERE Categoria = 'Notebook'
                    ); 
-- Exercicio 4. Descubra todas as informações sobre o cliente que gerou mais receita para a empresa.
SELECT * FROM clientes
WHERE ID_Cliente = ?;

SELECT ID_Cliente
FROM pedidos
GROUP BY ID_Cliente
ORDER BY SUM(Receita_Venda) DESC
LIMIT 1;

SELECT * FROM clientes
WHERE ID_Cliente = (
				SELECT 
                ID_Cliente
				FROM pedidos
				GROUP BY ID_Cliente
				ORDER BY SUM(Receita_Venda) DESC
				LIMIT 1
                );

-- 1.1 Subquery como filtro de uma nova consulta: filtrando por meio de uma lista de valores
-- Exercicio 1. Descubra qual foi a receita total associada aos produtos da marca DELL

SELECT 
ID_Produto 
FROM produtos 
WHERE Marca_Produto = 'DELL';

SELECT 
	SUM(Receita_Venda) AS 'Receita Marca DELL'
FROM pedidos
WHERE ID_Produto IN (
				SELECT 
				ID_Produto 
				FROM produtos 
				WHERE Marca_Produto = 'DELL'
                );
            