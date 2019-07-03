
-- Questao 2

sublistas :: [a] -> [[a]]
sublistas []      =  [[]]
sublistas (x:xs)  =  [ x:ys | ys <- sublistas xs ] ++ sublistas xs

-- Questao 3
-- (a)

poli :: Int -> Int -> Int -> (Int -> Int)
poli a b c = (\x -> (a * x * x) + (b * x) + c)

listaPoli :: [(Int,Int,Int)] -> [Int -> Int]
listaPoli l = [poli a b c | (a,b,c) <- l]
{-
listaPoli [] = []
listaPoli ((a,b,c):xs) = (poli a b c) : listaPoli xs
-}

appListaPoli :: [Int -> Int] -> [Int] -> [Int]
appListaPoli lp lint = [p i | p <- lp, i <- lint]


altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap f g [] = []
altMap f g (x:xs) = f x : altMap g f xs 


-- 
type Codigo = Int
data Voto = Presidente Codigo | Senador Codigo | Deputado Codigo
          | Branco deriving (Show) 

type Urna = [Voto]
type Apuracao = [(Voto, Int)]

totalVotos :: Urna −> Voto −> Int 
apurar : : Urna −> Apuracao

instance Eq Voto where
    (Presidente p1) == (Presidente p2) = p1 == p2
    (Senador s1)   == (Senador s2)   = s1 == s2  
    (Deputado d1) == (Deputado d2)  = d1 == d2
     Branco == Branco = True
     _ == _ = False
    
 umaUrna= [(Presidente 1), (Presidente 1) , 
  (Senador 1),(Senador 1),(Senador 1),
  (Presidente 2), (Presidente 3),
  (Deputado 1), (Deputado 1),(Deputado 1),
  (Deputado 1), (Deputado 1),(Deputado 1), 
  (Deputado 1), (Deputado 1),(Deputado 1),
  Branco, Branco, (Presidente 1)
  ]
 
 umaApuracao = [((Presidente 1), 1), ((Senador 1),3)] 
  
totalVotos :: Urna -> Voto  -> Int
totalVotos u v = length([ x | x <- u , x == v ]) 
    

apurar :: Urna -> Apuracao 
apurar [] = []
apurar (x:xs) = (x, 1 + totalVotos xs x): apurar (filter (/=x) xs) 

