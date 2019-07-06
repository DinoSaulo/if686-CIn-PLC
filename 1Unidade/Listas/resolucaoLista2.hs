-- 1

--a

-- esta funcao conta quantas vesse um inteiro se repete em uma lista
count :: Eq a => Integral b => a -> [a] -> b
count e = sum . map (\a -> if a == e then 1 else 0)

f :: [Int] -> [Int]
f [] = []
f (x:xs)
 | ((count x xs) > 0 && (x == head xs)) = [x] ++ f xs
 | otherwise = f xs

--b

f2 :: [Int] -> [Int]
f2 arr = [ i | (i, j) <- (zip arr (tail arr)), i == j]

--2

g :: [Int] -> Bool
g [] = True
g ex = foldr (&&) (True) (map (even) (filter (>=0) (filter (<=100) ex)))


-- [1, 26, 153, 74, 68, 9] => False
-- [12,153,74,10] => True
-- [] => False
-- [1,255] => False

-- 3

--a

type NomeFabricante = String
type Potencia = String

data Lampada = Compacta NomeFabricante Potencia | Incandescente NomeFabricante Potencia-- deriving (Show)

-- b

lamp = Compacta "Toshiba" "125 Wats"
lamp2 = Incandescente "LG" "50 Wats"
lamp3 = Incandescente "LG" "50 Wats"
lamp4 = Incandescente "Toshiba" "50 Wats"

instance Show(Lampada) where
    show (Compacta fabricante potencia) = "Lampada Compacta : Fabricante = " ++ fabricante ++ "; Potencia = " ++ potencia
    show (Incandescente fabricante potencia) = "Lampada Incandescente : Fabricante = " ++ fabricante ++ "; Potencia = " ++ potencia

-- show lamp3
-- show lamp

instance Eq(Lampada) where
    Compacta fabricanteA potenciaA == Compacta fabricanteB potenciaB = fabricanteA == fabricanteB && potenciaA == potenciaB
    Incandescente fabricanteA potenciaA == Incandescente fabricanteB potenciaB = fabricanteA == fabricanteB && potenciaA == potenciaB
    _ == _ = False

-- lamp == lamp3 => False
-- lamp3 == lamp4 => False
-- lamp3 == lamp2 => True