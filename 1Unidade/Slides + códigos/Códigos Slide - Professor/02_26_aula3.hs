
{- terceiro :: (Int, Char, Bool) -> Bool
terceiro (x,y,z) = z -}

terceiro :: (a, b, c) -> c
terceiro (x,y,z) = z


-- Sinonimos de tipos

type ParInt = (Int, Int)

primeiroParInt :: ParInt-> Int
primeiroParInt p = fst p

type Nome = String
type Idade = Int
type Pessoa = (Nome, Idade)
type ListaPessoa = [Pessoa]

nome :: Pessoa -> Nome
nome pessoa = fst pessoa

--type ParPoli t =  (t,t)
--type ListaParPoli t = [ParPoli t]


-- Casamento de padrao

myNot :: Bool -> Bool
myNot False = True
myNot True = False

myOr1 :: Bool -> Bool -> Bool
myOr1 True True = True
myOr1 True False = True
myOr1 False True = True
myOr1 False False = False

myOr2 :: Bool -> Bool -> Bool
myOr2 True x = True
myOr2 False x = x

myOr3 :: Bool -> Bool -> Bool
myOr3 True _ = True
myOr3 False x = x

-- Fatorial

fatorial :: Int -> Int
fatorial x
 | x == 0    = 1                      -- caso base
 | otherwise =  x * fatorial (x-1)    -- caso recursivo

fatorialCasamPadrao :: Int -> Int
fatorialCasamPadrao 0 = 1
fatorialCasamPadrao n = n * fatorialCasamPadrao (n-1)

-- Definicoes locais

-- <definicoes> where <definicoes>
-- let  <definicoes> in <expressao>

somaQuadrados :: Int -> Int -> Int
somaQuadrados x y = sqX + sqY
  where sqX = x * x
        sqY = y * y

somaQuadrados2 :: Int -> Int -> Int
somaQuadrados2 x y = sq x + sq y
  where sq n = n * n
     
somaQuadrados3 :: Int -> Int -> Int
somaQuadrados3 x y =
    let
        sqX = x * x
        sqY = y * y
    in
        sqX + sqY

-- Calculo de raizes

umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b / (2.0 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = (p - t ,  p + t)
    where
        p = (-b /(2* a))
        t = (sqrt (b^2 - 4.0 * a * c) / (2.0 * a))


raizes :: Float -> Float -> Float -> String
raizes a b c 
 | b^2 == 4.0 * a * c = show (umaRaiz a b c)
 | b^2 > 4.0 * a * c  =  show (fst (duasRaizes a b c))
                         ++ " "
                         ++ show (snd (duasRaizes a b c))
 | otherwise = "nao hah raizes"

-- Listas