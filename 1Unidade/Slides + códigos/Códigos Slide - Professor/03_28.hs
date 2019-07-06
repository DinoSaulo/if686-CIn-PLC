
data Expr = Lit Int
           | Add Expr Expr
           | Sub Expr Expr

eval :: Expr -> Int
eval (Lit n)     = n
eval (Add e1 e2) =  eval e1  + eval e2
eval (Sub e1 e2) =  eval e1  - eval e2

showExpr :: Expr -> String
showExpr (Lit n)     = show n
showExpr (Add e1 e2) = "(" ++ showExpr e1  ++ "+" ++ showExpr e2 ++ ")" 
showExpr (Sub e1 e2) = "(" ++ showExpr e1  ++ "-" ++ showExpr e2 ++ ")" 

data Lista t = Vazia | Cons t (Lista t) deriving (Show)

toList :: Lista t -> [t]
toList (Vazia)     = []
toList (Cons x l) = x : toList l 

fromList :: [t] -> Lista t
fromList []  = Vazia
fromList (x:xs) = (Cons x (fromList xs))

data NTree  = NilT | Node Int NTree NTree

somaArv :: NTree -> Int
somaArv (NilT)   = 0
somaArv (Node x arvEsq arvDir) = x + somaArv arvEsq + somaArv arvDir

{-
*Main> somaArv (Node 4 NilT NilT)
4
*Main> somaArv (Node 4 (Node 5 NilT NilT) NilT)
9
*Main> somaArv (Node 4 (Node 5 NilT NilT) (Node 3 NilT NilT))
12
-}

profundidade :: NTree -> Int
profundidade (NilT)   = 0
profudidade (Node _ arvEsq arvDir) = 1 + 
                              max (profundidade arvEsq) (profundidade arvDir)


collapse :: NTree -> [Int]
collapse (NilT)         = []
collapse (Node x t1 t2) = collapse t1 ++ [x] ++ collapse t2

-- Classes

type Nome = String
data Pessoa = M Nome | F Nome

instance Eq Pessoa where
  (M n1) == (M n2) = n1 == n2
  (F n1) == (F n2) = n1 == n2
  (M _) ==  (F _)  = False
  (F _) == (M _)   = False

class Visivel t where
    toString :: t -> String
    size     :: t -> Int

instance Visivel Bool where
    toString True = "True"
    toString False = "False"
    size _ = 1

instance Visivel Char where
    toString c = [c]
    size _     = 1

instance Visivel Pessoa where
    toString (M n) = "A pessoa: " ++ n ++ " "
    toString (F n) = "A pessoa: " ++ n ++ " "
    size (M _) = 1
    size (F _) = 1

instance Visivel a => Visivel [a] where
    toString = concat . (map toString)
    size     = (foldr (+) 0) . (map size)

instance (Eq t) => Eq (Lista t) where
    Vazia == Vazia                = True
    (Cons x1 l1) == (Cons x2 l2)  = x1 == x2 && l1 == l2

data Temperatura = Quente | Frio deriving (Eq, Ord, Show)
data DiasSemana = Dom | Seg | Ter | Qua | Qui | Sex | Sab
                   deriving (Eq, Ord, Show, Enum)