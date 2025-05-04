# USER-DEFINED VARIABLES

# Uma variável é um local onde armazenamos um determinado valor, que pode ser usado ao longo do nosso código.

# Tipos de dados:

-- INT: Inteiros
-- DECIMAL(M, D): Decimais com D dígitos e M casas decimais
-- VARCHAR(N): Textos com N caracteres
-- DATE: Data
-- DATETIME: Data/Hora

# Declaramos uma variável da sequinte forma:
-- SET @var = 10;

# Exemplo 1. Uma loja vendeu 10 unidades de um determinado produto, a um preço de R$ 10,90 cada.
# Utilize variáveis para calcular a receita total gerada nessa venda.

-- Declarando a variável de quantidade
SET @varQuantidade = 10;
SET @varPreco = 10.9;

SELECT @varQuantidade * @varPreco AS 'Receita Total';

#Exemplo 2. Crie uma consulta a tabela de produtos para mostrar apenas os produtos da marca DELL.alter
# Faça de forma que a marca DELL seja armazenada em uma variável.
SET @varMarca = 'DELL';

SELECT * 
FROM produtos
WHERE Marca_Produto = @varMarca;

