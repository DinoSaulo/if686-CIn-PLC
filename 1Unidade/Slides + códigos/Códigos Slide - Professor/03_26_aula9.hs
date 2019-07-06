
type Nome = String
tamNome :: String -> Int
tamNome n = length n

type ParInt = (Int, Int)
somaPar :: ParInt -> Int
somaPar (x, y) = x + y
-- somaPar p = fst p + snd p

data ParTAlg = Par Int Int

somaParTAlg :: ParTAlg -> Int
somaParTAlg (Par x y) = x + y

-- Alternativas

data Figura = Circulo Float | Retangulo Float Float

ehCircular :: Figura -> Bool
ehCircular (Circulo _) = True
ehCircular (Retangulo _ _)  = False

area :: Figura -> Float
area (Circulo r) = pi * r * r
area (Retangulo l1 l2) = l1 * l2

-- Tipos recursivos

data Expr = Lit Int
           | Add Expr Expr
           | Sub Expr Expr
           
{-
Lit 2
Add (Lit 1) (Lit 2)
Add (Lit 1) (Sub (Lit 6) (Add (Lit 9) (Lit 6)))
-}

eval :: Expr -> Int
eval (Lit n)     = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Sub e1 e2) = eval e1 - eval e2

{-
eval (Add (Lit 1) (Lit 2))
= eval (Lit 1) + eval (Lit 2)
= 1 + 2

eval (Add (Lit 1) (Sub (Lit 6) (Add (Lit 9) (Lit 6))))
= eval (Lit 1)  + eval (Sub (Lit 6) (Add (Lit 9) (Lit 6))))
= 1 + (eval (Lit 6) - eval (Add (Lit 9) (Lit 6)))
= 1 + (6 - (eval (Lit 9) + eval (Lit 6))
= 1 + (6 - ( 9 + 6 ))
= -8 
-}

data ListaInt = LVazia | Cons Int ListaInt

somaLInt :: ListaInt -> Int
somaLInt LVazia     = 0
somaLInt (Cons x l) = x + somaLInt l

{-
*Main> somaLInt LVazia
0
*Main> somaLInt (Cons 1 (Cons 2LVazia))
3
-}

somaL :: [Int] -> Int
somaL [] = 0 
somaL (x:xs)  = x + somaL xs

data ArvoreInt = AVazia | No Int ArvoreInt ArvoreInt

somaArvoreInt :: ArvoreInt -> Int
somaArvoreInt  AVazia = 0
somaArvoreInt  (No n aEsq aDir) = n 
                                  + somaArvoreInt aEsq 
                                  + somaArvoreInt aDir
{-
*Main> somaArvoreInt AVazia
0
*Main> somaArvoreInt (No 1 (No 2 AVazia AVazia) AVazia)
3
-}

-- Tipos de dados polimorficos

data ListaPoli t = Vazia | Constr t (ListaPoli t) 

{-
*Main> :t Vazia
Vazia :: ListaPoli t
*Main> :t Constr 4 (Vazia)
Constr 4 (Vazia) :: Num t => ListaPoli t
*Main> :t Constr 'a' (Vazia)
Constr 'a' (Vazia) :: ListaPoli Char
*Main> :t Constr True (Vazia)
Constr True (Vazia) :: ListaPoli Bool
-}
data ArvorePoli t = ArvVazia | Node t (ArvorePoli t) (ArvorePoli t)
                     deriving (Show)

{-
*Main> :t Node 2 (ArvVazia) (ArvVazia )
Node 2 (ArvVazia) (ArvVazia ) :: Num t => ArvorePoli t
*Main> :t Node True (ArvVazia) (ArvVazia )
Node True (ArvVazia) (ArvVazia ) :: ArvorePoli Bool
*Main> :t Node 'a' (ArvVazia) (ArvVazia )
Node 'a' (ArvVazia) (ArvVazia ) :: ArvorePoli Char
-}

-- Tipo para uniao

data Either a b = Left a | Right b

{-
f :: -> Either Int Bool
f .... = Left x
         where x = expressao_Int
f .... = Right y
          where y = expressao_Bool
-}

data MMaybe a = MNothing | MJust a
-- Em Haskell, tipo Maybe
mhead :: [t] -> MMaybe t
mhead [] = MNothing
mhead (x:_) = MJust x

usandoMhead :: (Show t) => [t] -> String
usandoMhead l = case mhead l of
                 MNothing -> "Lista Vazia"
                 MJust x -> "Cabeca da lista: " ++ show x 