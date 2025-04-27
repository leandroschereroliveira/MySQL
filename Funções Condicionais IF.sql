# Funções condicionais no MySQL

# IF: Função que permiter tratar condições no MySQL
-- IF(teste_logico, valor_se_verdadeiro, valor_se_falso)
-- IF(teste_logico1, valor_se_verdadeiro1, IF(teste_logico2, valor_se_verdadeiro2, valor_se_falso))

-- Exemplo1:
SELECT
	IF(10 > 5, 'Verdadeiro', 'Falso');

-- Exemplo2: Uma empresa oferece um bônus de 10% para todos os funcionários que tiveram uma avaliação do RH de acordo com a seguinte regra:
-- NotaDesempenho >= 7 ---> Recebe bônus de 10%
-- NotaDesempenho  < 7 ---> Não recebe bônus

SET @varNotaDesempenho = 8.5;

SELECT 
	IF(@varNotaDesempenho >= 7, 0.1, 'Sem bônus');
    

-- Exemplo3: Uma empresa oferece um bônus de 10%  e  5% para todos os funcionários que tiveram uma avaliação do RH de acordo com a seguinte regra:
-- NotaDesempenho >= 7 ---> Recebe bônus de 10%
-- NotaDesempenho >= 5 ---> Recebe bônus de 5%
-- NotaDesempenho  < 5 ---> Não recebe bônus

SET @varNotaDesempenho = 8.5;

SELECT 
	IF(@varNotaDesempenho >= 7, 'Recebe bônus de 10%', IF(@varNotaDesempenho >= 5, 'Recebe bônus de 5%', 'Sem bônus')) AS 'Resultado'; 

-- Exemplo4: As lojas da nossa empresa que tiverem mais de 20 funcionários receberão uma reforma de ampliação. Utilize a função IF para criar uma coluna na tabela Lojas que informe quais lojas receberão reforma e quais não receberão reforma.
SELECT * FROM lojas;

SELECT 
	*,
    IF(Num_Funcionarios >= 20, 'Recebe reforma', 'Não recebe reforma') AS 'Status'
	FROM lojas;
    
# IFNULL, ISNULL, NULLIF
# IFNULL: Retorna o valor alternativo caso a expressão seja NULL
-- IFNULL(expressão, valor_alternativo)
-- Exemplo1: Utilize a função IFNULL para retornar um valor alternativo para o valor abaixo.
SELECT
	IFNULL(NULL, 'Valor alternativo');

-- Exemplo1: A tabela de lojas pode ter lojas que não possuem telefone de contato. Neste caso, todas as lojas que tiverem um telefone NULL serão direcionadas para uma central de atendimento com um número padrão: 0800-999-9999. Utilize a função IFNULL para fazer esse ajuste.
SELECT 
	*,
    IFNULL(Telefone, '0800-999-9999') AS 'Telefone corrigido'
FROM lojas;

# ISNULL: Testa se um determinado valor é NULL. Caso seja nulo, retorna 1, caso contrário retorna zero.
    
-- Exemplo1: Alguns clientes não cadastraram o telefone de contato. Faça uma consulta com uma coluna extra que identifique esses clientes de alguma forma.
SELECT 
	*,
    IF(ISNULL(Telefone), 'Verificar', 'OK') AS 'Status'
FROM clientes;

# NULLIF: Compara duas expressões e retorna NULL se as duas forem iguais. Se forem, retorna NULL, caso contrário, retorna a primeira expressão.

SET @var1 = 100;
SET @var2 = 100;

SELECT
	NULLIF(@var1, @var2);