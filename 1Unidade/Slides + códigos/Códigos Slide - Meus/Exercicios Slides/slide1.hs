-- Fatorial
fat :: Int -> Int
fat n
 | n == 0 = 1
 | otherwise = fat (n-1) * n

-- Verifica se todos os quatro numeros sao iguais
all4Equal :: Int -> Int -> Int -> Int -> Bool
all4Equal a b c d = (a == b) && (a == c) && (a == d) && (b == c) && (b == d)  && (c == d)

--retorna quantos argumentos são iguais
equalCount :: Int -> Int -> Int -> Int
equalCount a b c
 | ((a == b) && (b == c)) = 3
 | ((a == b) || (b == c) || (a == c)) = 2
 | otherwise = 0

-- Defina uma função que, dado um valor inteiro s e um número de semanas n, retorna quantas semanas de 0 a n tiveram vendas iguais a s.
vendas :: Int -> Int
vendas 0 = 4
vendas 1 = 0
vendas 2 = 0
vendas 3 = 2
vendas 4 = 8
vendas 5 = 9
vendas 6 = 2
vendas 7 = 2

isEqual :: Int -> Int -> Int
isEqual s n
 | (vendas n == s) = 1
 | otherwise = 0

func :: Int -> Int -> Int
func s n
 | n == 0 = isEqual s n
 | otherwise = (isEqual s n)  + (func s (n-1))