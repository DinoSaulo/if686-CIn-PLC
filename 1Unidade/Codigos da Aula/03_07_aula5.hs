
double :: [Int] -> [Int]
double []     = []
double (x:xs) = (2*x) : double xs

member :: [Int] -> Int -> Bool
member [] y = False
member (x:xs) y 
 | x == y    = True
 | otherwise = member xs y

digitosLista :: String -> String
digitosLista [] = []
digitosLista (a:as)
 | ehDigito a = a : digitosLista as
 | otherwise  = digitosLista as

ehDigito :: Char -> Bool
ehDigito ch =  (ch >= '0') && (ch <= '9')

primeiroDigito :: String -> Char
primeiroDigito st = case (digitosLista st) of
    [] -> '\0'
    (x:xs) -> x

tamLista :: [t] -> Int
tamLista []     = 0
tamLista (x:xs) = 1 + tamLista xs

-- Compreensao de lista

ehPar :: Int -> Bool
ehPar x = (mod x 2) == 0

dobrarLista :: [Int] -> [Int]
dobrarLista l = [ 2*x | x <- l]

dobrarListaPar :: [Int] -> [Int]
dobrarListaPar l = [ 2*x | x <- l, ehPar x]

somarPares :: [(Int,Int)] -> [Int]
somarPares l = [ x + y | (x,y) <- l ]
-- somarPares l = [fst p + snd p, p <- l]

l1 = [ 2*x | x <- [1..10]]

l2 = [ 2*x | x <- [1..20], (mod x 2) == 0]

l3 = [ 2*x | x <- [1..20], (mod x 2) == 0, x >= 10]

l4 = [ 2*x | x <- [1..20], (mod x 2) == 0, x >= 10, x < 18]

tamListaCompLista l = sum [ 1 | _ <- l ]

digLista l = [ x | x <- l, ehDigito x]

triangulos = [(a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10]]

triangulos2 = [(a, b, c) | a <- [1..10], b <- [1 .. a], c <- [1.. b]]

triangulosRetangulos = [(a, b, c) | 
                        c <- [1..10], b <- [1..c], a <- [1..b],
                        a ^ 2 + b ^ 2 == c ^ 2,
                        a + b + c == 24]

qSort :: [Int] -> [Int]
qSort [] = []
qSort (x:xs) = qSort[y| y <- xs, y <= x] ++ 
               [x] ++ 
               qSort[ y | y <- xs, y > x]