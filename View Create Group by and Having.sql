# 1. VIEWS + GROUP BY: Criando Views com consultas filtradas.

-- Exemplo 1. Crie view q será o resultado de um agrupamento da tabela de pedidos. A ideia é que vc tenha nessa view o total de receita e custo agrupados por ID_Produto.
CREATE VIEW vwReceitaECustoTotal AS
SELECT
	ID_Produto,
    SUM(Receita_Venda) AS 'Total Receita',
    SUM(Custo_Venda) AS 'Total Custo'
FROM pedidos
GROUP BY ID_Produto;

SELECT * FROM vwreceitaecustototal;

-- Exemplo 2. Altere a view anterior para mostrar o agrupamento apenas para os produtos que tiveram uma receita total maior 1M e loja 2.
ALTER VIEW vwReceitaECustoTotal AS
SELECT
	ID_Produto,
    SUM(Receita_Venda) AS 'Total Receita',
    SUM(Custo_Venda) AS 'Total Custo'
FROM pedidos
WHERE ID_Loja = 2
GROUP BY ID_Produto
HAVING SUM(Receita_Venda) >= 1000000;

SELECT * FROM vwreceitaecustototal;

