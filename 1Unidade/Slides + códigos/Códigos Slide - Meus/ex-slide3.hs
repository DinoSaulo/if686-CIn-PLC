sumList :: [ Int ] -> Int
sumList [] = 0
sumList ( a : as ) = a + sumList as

-- ex
--dobrar os elementos de uma lista:
double :: [Int] -> [Int]
double [] = []
double ( a : as ) = (a*2 : double as)

--determinar se um valor faz parte de uma lista:
member :: [Int] -> Int -> Bool
member [] a = False
member (x : xs) a
 | x == a = True
 | otherwise = member xs a

-- somar uma lista de pares: 
sumPairs :: [( Int, Int)]->[Int]
sumPairs [(a, b)] = [a+b]

-- slides

maiorLista :: [ Int ] -> Int
maiorLista [ ] = minBound :: Int
maiorLista [x] = x
maiorLista ( x : xs )
 | x > maiorLista xs = x
 | otherwise = maiorLista xs

lengthx :: [t] -> Int
lengthx [] = 0
lengthx ( x : xs ) = 1 + lengthx xs

-- exercicios

-- take: devolve uma lista como os n primeiros elementos da lista de entrada

--mtake :: [t] -> Int -> [t]
mtake _ []     = []
mtake 0 _      = []
mtake n (x:xs) = x : mtake (n-1) xs

mdrop 0 lista = lista 
mdrop _  []   = []
mdrop n (x:xs) = mdrop (n-1) xs

-- ordenacao

iSort :: [Int] -> [Int]
iSort []     = []
iSort (x:xs) = ins x (iSort xs)

ins :: Int -> [Int] -> [Int]
ins x [] = [x]
ins x (y:ys)
 | x <= y    = (x:y:ys)
 | otherwise = y : ins x ys

-- compressao de lista
doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList xs = [ 2 * a | a <- xs ]