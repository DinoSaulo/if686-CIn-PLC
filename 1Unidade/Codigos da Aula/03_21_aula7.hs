-- 03_21

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f =  id
iter n f =  (iter (n-1) f) . f

{-
iter 3 f
= (iter 2 f) . f
=  ((iter 1 f) . f) . f
=  (((iter 0 f) .f) . f) . f
=  (((id) .f) . f) . f
-}

-- Aplicacao parcial

allEqual :: Int -> Int -> Int -> Bool
allEqual x y z = (x == y) && (y == z)

{-
f a b = (f a) b
allEqual 1 2 3
= (allEqual 1) 2 3
= ((allEqual 1) 2) 3
-}

{-
iter 4 (/2) 
= (iter 3 (/2)) . (/2)
= ((iter 2 (/2)) . (/2))  .(/2)
= (((iter 1 (/2)). (/2)) . (/2))  .(/2)
= (((iter 0 (/2)) . (/2)). (/2)) . (/2))  .(/2)
= ((id) . (/2)). (/2)) . (/2))  .(/2)
-}

{-
iter 4 ((/) 2))
= (iter 3 ((/) 2))) . ((/) 2))
= ((iter 2 ((/) 2))) . ((/) 2)))  . ((/) 2))
= (((iter 1 ((/) 2))). ((/) 2))) . ((/) 2)))  . ((/) 2))
= (((iter 0 ((/) 2))) . ((/) 2))). ((/) 2))) . ((/) 2)))  . ((/) 2))
= ((id) . ((/) 2))). ((/) 2))) . ((/) 2)))  . ((/) 2))
-}

{-
(op y) x = x op y
(y op) x = y op x
-}

-- Tipos algebricos

-- Enumeracoes

data Temp = Frio | Quente deriving (Eq, Show, Ord)
data DiasSemana = Dom | Seg | Ter | Qua | Qui | Sex | Sab deriving (Show, Enum)
data Estacao = Inverno | Verao | Outono | Primavera

clima :: Estacao -> Temp
clima Inverno  = Frio
clima _        = Quente
{-
clima Verao    = Quente
clima Outono   = Quente 
clima Primavera = Quente
-}

-- Produto

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade

exibirPessoa :: Pessoas -> String
exibirPessoa (Pessoa n i) = n ++ " " ++ show i

type PessoasPar = (Nome, Idade)
exibirPar :: PessoasPar -> String
exibirPar (n,i) = n ++ " " ++ show i

