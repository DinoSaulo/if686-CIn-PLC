
type Pessoa = String
type Livro = String
type BD = [(Pessoa, Livro, Int)]

--livros :: BD -> Pessoa -> [Livro]
livros1 (x:xs) p
 | fst x == p = snd x : livros1 xs p
 | otherwise = livros1 xs p

livros2 ((x,y):xs) p
 | x == p = y : livros2 xs p
 | otherwise = livros2 xs p

livros3 bd p = [snd p | x <- bd, fst x == p ]
livros4 bd p = [ y | (x,y) <- bd, x == p ]

-- Polimorfismo (parametrico)

tamLista :: [t] -> Int
tamLista []     = 0
tamLista (x:xs) = 1 + tamLista xs

-- Funcao de alta ordem

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

inc :: Int -> Int
inc x = x + 1

---
vendas :: Int -> Int
vendas 0 = 4
vendas 1 = 0
vendas 2 = 8
vendas 3 = 5

total :: (Int -> Int) -> Int -> Int
total f 0 = f 0
total f n = f n + total f (n-1)

totalVendas n = total vendas n

sq :: Int -> Int
sq x = x * x

somaQuadrados n = total sq n

maxi :: Int -> Int -> Int
maxi x y
 | x >= y    = x
 | otherwise = y

maxFun :: (Int -> Int) -> Int -> Int
maxFun f 0 = f 0
maxFun f n = maxi (maxFun f (n-1)) (f n)

zeroInRange :: (Int -> Int) -> Int -> Bool
zeroInRange f 0 = ( f 0 == 0)
zeroInRange f n = zeroInRange f (n-1) || (f n == 0)