sublistas :: [a] -> [[a]]
sublistas [] = [[]]
sublistas (x : xs) = [x : a | a <- sublistas xs] ++ sublistas xs

-- 3
-- A
poli :: Int -> Int -> Int -> Int -> Int
poli a b c = (\x -> a*(x*x) + b*x + c )

-- B
listaPoli :: [(Int, Int, Int)] -> [Int->Int]
listaPoli l = [poli a b c | (a,b,c) <- l]


listaPoliNormal :: [(Int, Int, Int)] -> [Int->Int]
listaPoliNormal [] = []
listaPoliNormal ((a,b,c):xs) = (poli a b c) : listaPoliNormal xs

-- C
appListaPoli :: [Int->Int] -> [Int] -> [Int]
appListaPoli lp lint = [p i | p <- lp, i <- lint]--USANDO COMPREENSÃO DE LISTA

appListaPoliNormal :: [Int->Int] -> [Int] -> [Int]
appListaPoliNormal [] _ = []
appListaPoliNormal _ [] = []
appListaPoliNormal (x:xs) (a:b) = (x a):(appListaPoliNormal xs b)

-- 4

