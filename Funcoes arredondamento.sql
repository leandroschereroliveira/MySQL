# Operações básicas e funções de arredondamento

# 1. Operações básicas
SELECT 
	10 + 20        as 'Soma',
    100 - 40       as 'Subtração',
    5 * 20         as 'Multiplicação',
    300 / 12       as 'Divisão',
    (100 - 10) * 4 as 'Operação',
    22 % 5         as 'Resto da divisão';
    
# 2. Funções de arredondamento
SELECT 
	round(87.149, 2)   	as 'Arred.',
    floor(87.149)		as 'Arred. p/ baixo',
    ceiling(87.149)		as 'Arred. p/ cima',
    truncate(87.149, 2) as 'Truncar';