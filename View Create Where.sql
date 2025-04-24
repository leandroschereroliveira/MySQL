# Exemplos Views

# 1. VIEWS + WHERE: Criando Views com consultas filtradas.

-- Exemplo 1. Crie uma View chamada vwReceitaAcima4000 que armazene todas as colunas da tabela Pedidos.
SELECT * FROM pedidos;

CREATE VIEW vwReceitaAcima4000 AS
SELECT
	*
FROM pedidos
WHERE Receita_Venda >= 4000;


SELECT * FROM vwReceitaAcima4000;

# Exemplo 2. Crie uma View chamada vwProdutosAtualizada que armazene todas as colunas da tabela Produtos. Apenas marcas DELL, SAMSUNG e SONY.

CREATE VIEW vwProdutosAtualizada AS
SELECT
	*
FROM produtos
WHERE Marca_Produto IN ('DELL', 'SAMSUNG', 'SONY');

SELECT * FROM vwprodutosatualizada;
