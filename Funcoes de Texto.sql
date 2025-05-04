# Funções de Texto no MySQL

# 1. LENGTH: Retorna a quantidade de caracteres de um texto
-- Exemplo 1. Descubra a quantidade de caracteres do texto 'SQL Impressionador'.
SET @varQuantidade = 'SQL Impressionador';

SELECT LENGTH(@varQuantidade);

# Exemplo 2. Descubra a quantidade de caracteres de cada nome na tabela clientes.
SELECT
	Nome,
    LENGTH(Nome) AS 'Núm. Caract.'
FROM clientes;

# 2. CONCAT e CONCAT_WS: Utilizados para concatenar textos. A segunda opção permite especificar um separador que será utilizado entre cada texto.
-- Exemplo 1. Crie 2 variáveis: @varNome e @varSobrenome, declare um nome e um sobrenome, respectivamente.
SET @varNome = 'Marcus';
SET @varSobrenome = 'Cavalcanti';
SET @varUltimoNome = 'Jesus';

SET @varNomeCompleto = CONCAT(@varNome, ' ', @varSobrenome, ' ', @varUltimoNome);
SET @varNomeCompleto2 = CONCAT_WS(' ',@varNome, @varSobrenome, @varUltimoNome);

SELECT @varNomeCompleto2;

-- Exemplo 2. Utilize as funções CONCAT e CONCAT_WS na tabela de clientes para criar uma coluna de nome completo.
SELECT
	ID_Cliente,
    Nome,
    Sobrenome,
    CONCAT_WS(' ', Nome, Sobrenome) AS 'Nome Completo',
    Email
FROM clientes;

# 3. LCASE e UCASE: Deixam um texto em minúscula e maiúscula, respectivamente.
-- Exemplo 1. Utilize as funções LCASE e UCASE com as variáveis abaixo.
SET @nome = 'Fernando';
SET @sobrenome = 'Martins';

SELECT LCASE(@nome), UCASE(@sobrenome);

-- Exemplo 2. Utilize as funções LCASE e UCASE nas colunas de nome completo abaixo.
SELECT
	LCASE(CONCAT(Nome, ' ', Sobrenome)) AS 'Nome Completo Concat',
    UCASE(CONCAT_WS(' ', Nome, Sobrenome)) AS 'Nome Completo Concat_ws'
FROM clientes;

# 4. LEFT E RIGHT: Permitem extrair uma parte de um texto, mais à esquerda, ou mais à direita.
-- Exemplo 1. Separe o texto abaixo em 2 partes: 'SQL' e 'Hashtag'.alter
SET @var = 'SQL Hashtag';
SELECT 
	LEFT(@var, 3) AS 'Left',
    RIGHT(@var, 7) AS 'Right';
-- Exemplo 2. Separe os códigos da coluna Num_Serie (tabela 'produtos') em 2 partes.
SELECT
	LEFT(Num_Serie, 6) AS 'Cod 1',
    RIGHT(Num_Serie, 6) AS 'Cod 2'
FROM produtos;

# 5. REPLACE: Substitui um texto por outro texto.
-- Exemplo 1. No texto abaixo, substitua 'HIMYM' por 'Friends'.
SET @texto = 'HIMYM é a melhor série de comédia.';
SET @textonovo = REPLACE(@texto, 'HIMYM', 'Friends');
SELECT @textonovo;

-- Exemplo 2. Substitua o texto 'S' por 'Solteiro'. Em seguida, substitua 'C' por 'Casado'.
SELECT
	Nome,
    Estado_Civil,
    REPLACE(REPLACE(Estado_Civil, 'S', 'Solteiro'), 'C', 'Casado') AS 'Estado Civil2'                -- Utilize o REPLACE nesta linha
FROM clientes;

# 6. INSTR e MID: A INSTR retorna a posição de um determinado caractere e a função MID extrai textos de forma personalizada ( de acordo com a posição inicial).
-- Exemplo 1. Utilize o e-mail abaixo par fazer as seguintes ações:
-- a) Retornar a posição do caractere '@'.
-- b) Retornar o id do e-mail

SET @email = 'marcus@gmail.com';

SET @varPos = INSTR(@email, '@');
SELECT @varPos;
-- Resultado: 7
SET @varIdEmail = MID(@email, 1, @varPos -1);
SELECT @varIdEmail;
-- Resultado: marcus

-- Exemplo 2. Utilize as funções INSTR e MID para retornar o ID de todos os e-mails da tabela de clientes.
SELECT Email, INSTR(Email, '@') FROM clientes;

SELECT 
	Email, 
    MID(Email, 1, INSTR(Email, '@') -1) AS 'ID_NOME'
FROM clientes;


