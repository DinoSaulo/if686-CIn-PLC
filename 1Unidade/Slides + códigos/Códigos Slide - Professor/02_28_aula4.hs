
fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * fatorial (n-1)

-- Listas

somaLista :: [Int] -> Int
somaLista []     = 0 -- caso base
somaLista (x:xs) = x + somaLista xs   -- caso recursivo
 
{-
somaLista [1,2,3]
= somaLista (1:(2:(3:[])))
= 1 + somaLista (2:[3])
= 1 + (2 + somaLista (3:[]))
= 1 + (2 + ( 3 + somaLista [])
= 1 + (2 + ( 3 + 0)
-}

tamLista :: [Int] -> Int
tamLista []     = 0
tamLista (x:xs) = 1 + tamLista xs 

-- Funcao de concatenacao de listas : (++) :: [a] -> [a] -> [a]

reverterLista :: [Int] -> [Int]
reverterLista []     = []
reverterLista (x:xs) = reverterLista xs  ++ [x]

repeticao :: Int -> Char -> String
repeticao 0 ch  = []
--repeticao n ch  =  ch : repeticao (n-1) ch
repeticao n ch = [ch] ++ repeticao (n-1) ch

mtake _ []     = []
mtake 0 _      = []
mtake n (x:xs) = x : mtake (n-1) xs

mdrop 0 lista = lista 
mdrop _  []   = []
mdrop n (x:xs) = mdrop (n-1) xs

{-
mdrop 2 [1,2,3]
= mdrop 1 [2,3]
= mdrop 0 [3]
= [3]
-}

-- ordenacao

iSort :: [Int] -> [Int]
iSort []     = []
iSort (x:xs) = ins x (iSort xs)

ins :: Int -> [Int] -> [Int]
ins x [] = [x]
ins x (y:ys)
 | x <= y    = (x:y:ys)
 | otherwise = y : ins x ys