# Funções de Data no MySQL

# 1. DAY(): Retorna o dia de uma data
# 2. MONTH(): Retorna o mês de uma data
# 3. YEAR(): Retorna ano de uma data
SELECT
	Nome,
    Data_Nascimento,
    DAY(Data_Nascimento) AS 'Dia',
    MONTH(Data_Nascimento) AS 'Mês',
    YEAR(Data_Nascimento) AS 'Ano'
FROM clientes;

# 1. NOW(): Retorna a data e hora atuais
# 2. CURDATE(): Retorna a data atual
# 3. CURTIME(): Retorna a hora atual

SELECT
	NOW(),
    CURDATE(),
    CURTIME();
    
# Funções de cálculos com Data: DATEDIFF, DATE_ADD e DATE_SUB

# 1. DATEDIFF: Retorna a diferença entre duas datas
-- Calcular o temp de entrega (em dias) de um projeto.
SET @varDataInicio = '2021-04-10';
SET @varDataFim = '2021-07-15';
SELECT DATEDIFF(@varDataFim, @varDataInicio);

# 2. DATE_ADD: Adiciona uma quantidade de dias/ meses/ ano a uma determinada data.
-- Um projeto deve ser entregue 10 duas após a data de início. Qual é a data final de entrega?
SET @varDataInicio = '2021-04-10';
SELECT DATE_ADD(@varDataInicio, INTERVAL 10 DAY);

#3. DATE_SUB: Subtrai uma quantidade de dias/ meses/ anos de uma determinada data.
-- Um projeto finalizou no dia '2021-09-21' e teve 10 dias de duração.
SET @varDataFim = '2021-07-15';
SELECT DATE_ADD(@varDataFim, INTERVAL 10 DAY); 



