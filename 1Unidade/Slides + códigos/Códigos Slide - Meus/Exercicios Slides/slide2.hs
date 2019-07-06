-- Defina a funcao addEspacos que produz um string com uma quantidade n de espaços.
addEspacos :: Int -> String
addEspacos n
 | n == 0 = ""
 | otherwise = " " ++ addEspacos(n-1)

-- Defina a função para Direita utilizando a definição de addEspacos para adiciconar uma quantidade n de espaços à
-- esquerda de um dado String, movendo o mesmo para a direita.
paraDireita :: Int -> String -> String
paraDireita n str
 | n == 0 = "" ++ str
 | otherwise = " " ++ paraDireita (n-1) str

--Escreva uma função para retornar, em forma de tabela, todas as vendas da semana 0 até a semana n, incluindo o total e a média de
-- vendas no período. Usem as funções definidas previamente e defina novas funções que achar necessário.
vendas :: Int -> Int
vendas 0 = 12
vendas 1 = 14
vendas 2 = 15

-- me recuso a fazer

-- Defina a função menorMaior que recebe três inteiros e retorna uma tupla com o menor e o maior deles, respectivamente.

maior :: Int -> Int -> Int -> Int
maior a b c
 | ((a >= b) && (a >= c)) = a
 | ((b >= a) && (b >= c)) = b
 | otherwise = c

menor :: Int -> Int -> Int -> Int
menor a b c
 | ((a <= b) && (a <= c)) = a
 | ((b <= a) && (b <= c)) = b
 | otherwise = c

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c = ( (menor a b c), (maior a b c))

-- Defina a função ordenaTripla que recebe uma tripla de inteiros e ordena a mesma.
ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c)
 | ((a == (menor a b c)) || ( a == (maior a b c))) && ((b == (menor a b c)) || ( b == (maior a b c))) = ((menor a b c), c, (maior a b c))
 | ((a == (menor a b c)) || ( a == (maior a b c))) && ((c == (menor a b c)) || ( c == (maior a b c))) = ((menor a b c), b, (maior a b c))
 | otherwise = ((menor a b c), a, (maior a b c))