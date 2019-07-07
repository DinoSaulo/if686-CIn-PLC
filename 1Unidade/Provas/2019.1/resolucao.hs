-- 1 QUESTÃO

vendas :: Int -> Int
vendas 0 = 4
vendas 1 = 0
vendas 2 = 0
vendas 3 = 2
vendas 4 = 8
vendas 5 = 9
vendas 6 = 2
vendas 7 = 2
vendas 8 = 9
vendas 9 = 0

-- A

zeroVendasA :: Int -> Int
zeroVendasA num = length [ 'x' |  x <- [0..num], (vendas x) == 0]

--B

zeroVendasB :: Int -> Int
zeroVendasB num = length (filter (== 0) (map vendas [0..num]))

-- C

zeroVendasC :: Int -> Int
zeroVendasC num = foldr(\y x -> x + (if ((vendas y) == 0) then 1 else 0)) 0 [0..num]

-- 2 QUESTÃO

--A
type CidadeOrigem = String
type CidadeDestino = String

data ClasseTrem = PrimeiraClasse | SegundaClasse deriving (Show)
data ClasseAviao = ClasseEconomica | ClasseExecutiva deriving (Show)

data Bilhete = Aviao CidadeOrigem CidadeDestino ClasseAviao | Trem CidadeOrigem CidadeDestino ClasseTrem | Onibus CidadeOrigem CidadeDestino deriving (Show)

bilhete = Aviao "Salvador" "Rio" ClasseEconomica -- apenas para testar

--B

bilhete1 = Aviao "Salvador" "Rio" ClasseEconomica
bilhete2 = Aviao "Rio" "SaoPaulo" ClasseEconomica
bilhete3 = Aviao "SaoPaulo" "Curitiba" ClasseEconomica

bilhetes = [bilhete1, bilhete2, bilhete3]


valida :: [Bilhete] -> Bool
valida [] = False
valida [x] = True
valida (x:xs) = (origem x == destino (head xs)) && (valida xs)
    where
        origem(Trem o1 d1 c1) = o1
        origem(Aviao o1 d1 c1) = o1
        origem(Onibus o1 d1) = o1
        destino(Trem o1 d1 c1) = d1
        destino(Onibus o1 d1) = d1
        destino(Aviao o1 d1 c1) = d1

-- 4

data Nat = Zero | Succ Nat deriving (Eq, Show)

-- a

int2Nat :: Int -> Nat
int2Nat 0 = Zero
int2Nat num = Succ (int2Nat (num-1))

-- b

nat2Int :: Nat -> Int
nat2Int Zero = 0
nat2Int (Succ n) = 1 + (nat2Int n)

-- c

soma :: Nat -> Nat -> Int
soma Zero _ = _
soma _ Zero = _
soma nat1 nat2 = int2Nat (sum (nat2Int nat1) (nat2Int nat2))

-- d

mult :: Nat -> Nat -> Int
mult Zero _ = _
mult _ Zero = _
mult nat1 nat2 = int2Nat ((nat2Int nat1) * (nat2Int nat2))

