-- 1
funcBC :: Bool -> Int
funcBC True = 1
funcBC False = 0

funcAB :: Char -> Bool
funcAB ch
 | ch == 'a' = True
 | otherwise = False

funcPonto :: (b -> c) -> (a -> b) -> a -> c
funcPonto func1 func2 char = (.) func1 func2 char

-- funcPonto funcBC funcAB 'a'

-- A expressão map . (.)

-- 2

-- Modo recursivo
sublistas :: [a] -> [[a]]
sublistas xs = sublistas [] xs where
    sublistas a [b] = [ a ++ [b] ]
    sublistas a (b:bs) = [ a ++ [b] ] ++ sublistas (a ++ [b]) bs

-- modo concatenação
sublistas2 :: [a] -> [[a]]
sublistas2 [] = [[]]
sublistas2 (x : xs) = [x : sublista | sublista <- sublistas xs] ++ sublistas xs

--3

--a

poli1 :: Int -> Int -> Int -> Int -> Int
poli1 a b c =(\ x -> a * (x * x) + b * x + c)

-- b

listaPoli :: [(Int, Int, Int)] -> [Int->Int]
listaPoli [] = []
listaPoli l = [poli1 a b c | (a,b,c) <- l]

listaPoli2 :: [(Int, Int, Int)] -> [Int->Int]
listaPoli2 [] = []
listaPoli2 ((a,b,c):xs) = (poli1 a b c) : listaPoli2(xs)

-- c

appListaPoliNormal :: [Int->Int] -> [Int] -> [Int]
appListaPoliNormal [] _ = []
appListaPoliNormal _ [] = []
appListaPoliNormal (x:xs) (a:b) = (x a):(appListaPoliNormal xs b)

--USANDO COMPREENSÃO DE LISTA
appListaPoli :: [Int->Int] -> [Int] -> [Int]
appListaPoli lp lint = [p i | p <- lp, i <- lint]

appListaPoli2 :: [Int->Int] -> [Int] -> [Int]
appListaPoli2 _ [] = []
appListaPoli2 [] l = l
appListaPoli2 fl il = [ f(x) | (f,x) <- zip fl il ]

-- 4

--a

matriz1 = [ [1, 2, 3], [1, 2, 3], [1, 2]]
matriz2 = [ [1, 2, 3], [1, 2, 3], [1, 2, 3]]

ehMatriz :: [[a]] -> Bool
ehMatriz [] = False
ehMatriz [[]] = True
ehMatriz arr
 | ( (head ([length x | x <- arr])) * (length ( [length x | x <- arr]))) == ( foldr (+) 0 ( [length x | x <- arr])) = True
 | otherwise = False

-- ehMatriz matriz1 --> False
-- ehMatriz matriz2 --> True

-- b

-- !! ATENÇÃO !! O primeiro numero oferecido tem que ser menor que o primeiro, se não buga
-- ex swapElementsAt 0 2 [ [0, 0, 0], [1, 1, 1], [2, 2, 2]] -> [[2,2,2],[1,1,1],[0,0,0]]

swapElementsAt :: Int -> Int -> [a] -> [a]
swapElementsAt i j xs = let elemI = xs !! i
                            elemJ = xs !! j
                            left = take i xs
                            middle = take (j - i - 1) (drop (i + 1) xs)
                            right = drop (j + 1) xs
                    in  left ++ [elemJ] ++ middle ++ [elemI] ++ right

-- 5

-- [[2,3,4,5,6], [1,2,3], [9]]

somaImparMaiorQuePar :: [Int] -> Bool
somaImparMaiorQuePar [] = False
somaImparMaiorQuePar arr
 | (sum [ x | x <- arr, odd x ]) > (sum [ y | y <- arr, even y ]) = True
 | otherwise = False

filtraListaSomaImpares :: [[Int]] -> [[Int]]
filtraListaSomaImpares [[]] = [[]]
filtraListaSomaImpares arr = filter (somaImparMaiorQuePar) (arr)

maiorSoma :: [[Int]] -> Int
maiorSoma [] = 0
maiorSoma (x:xs) = max (sum x) (maiorSoma xs)

filtrarEInserir :: [[Int]] -> Int -> ([[Int]], Int)
filtrarEInserir [[]] _ = ([[]], -1)
filtrarEInserir a b =
    let x = filtraListaSomaImpares a
        y = b * maiorSoma x
    in (x, y)

-- 6

altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap _ _ [] = []
altMap  f g (x:xs) = (f x):(altMap g f xs)

--altMap (+10) (+100) [0 .. 4]

-- 5
type Codigo = Int
data Voto = Presidente Codigo | Senador Codigo | Deputado Codigo | Branco deriving (Show)

type Urna = [Voto]
type Apuracao = [(Voto, Int)]

instance Eq(Voto) where
    Presidente codigoA == Presidente codigoB = codigoA == codigoB
    Senador codigoA == Senador codigoB = codigoA == codigoB
    Deputado codigoA == Deputado codigoB = codigoA == codigoB
    Branco == Branco = True
    _ == _ = False

-- Testes
voto1 = Presidente 17
voto2 = Presidente 13
voto3 = Presidente 17
voto4 = Deputado 4002
voto5 = Senador 245
voto6 = Branco
voto7 = Branco
voto8 = Deputado 4002
voto9 = Deputado 4002
voto10 = Deputado 4002

-- urninha = [voto1,voto2,voto3,voto4,voto5,voto6,voto7,voto8,voto9,voto10]

-- b

totalVotos :: Urna -> Voto -> Int
totalVotos [] _ = 0
totalVotos urna v
 | (v == head urna) = 1 + totalVotos (tail urna) v
 | otherwise = totalVotos (tail urna) v

-- c

apurar :: Urna -> Apuracao
apurar u = [(l, totalVotos u l) | l <- candidatos u] 

candidatos :: Urna -> [Voto]
candidatos [] = []
candidatos (x:xs) = x : filter (/= x) (candidatos xs)