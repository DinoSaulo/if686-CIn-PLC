-- 21_fev

maiorDeTresInteiros :: Int -> Int -> Int -> Int
maiorDeTresInteiros x y z
 | x >= y && y >= z = x
 | y >= z = y
 | otherwise = z

offSet :: Int
offSet = fromEnum 'A' - fromEnum 'a'

toUpper :: Char -> Char
toUpper ch = toEnum (fromEnum ch + offSet)

isDigit :: Char -> Bool
isDigit ch = (ch >= '0') && (ch <= '9')
 

addPair :: (Int, Int) -> Int
--addPair par = fst par + snd par
addPair (x,y) = x + y

primeiroElemTripla :: (Int, Int, Int) -> Int
primeiroElemTripla (x,y,z) = x

-- Calculo de raizes

umaRaiz :: Float -> Float -> Float -> Float
umaRaiz a b c = -b / (2.0 * a)

duasRaizes :: Float -> Float -> Float -> (Float, Float)
duasRaizes a b c = ((-b /(2* a)) - (sqrt (b^2 - 4.0 * a * c) / (2.0 * a)) , (-b /(2* a)) + (sqrt (b^2 - 4.0 * a * c) / (2.0 * a)))

raizes :: Float -> Float -> Float -> String
raizes a b c 
 | b^2 == 4.0 * a * c = show (umaRaiz a b c)
 | b^2 > 4.0 * a * c  =  show (fst (duasRaizes a b c))
                         ++ " "
                         ++ show (snd (duasRaizes a b c))
 | otherwise = "nao hah raizes"

vendas :: Int -> Int
vendas 0 = 5
vendas 1 = 12
vendas 2 = 3
vendas 3 = 9
vendas 4 = 8

totalVendas :: Int -> Int
totalVendas n 
 | n == 0 = vendas 0       -- Caso base
 | n > 0 =  totalVendas (n-1) + vendas n  -- Caso recursivo

{--
totalVendas 3 
= totalVendas 2 + vendas 3
= totalVendas 1 + vendas 2 + vendas 3
= totalVendas 0 + vendas 1 + vendas 2 + vendas 3
= vendas 0 + vendas 1 + vendas 2 + vendas 3
--}

maxi :: Int -> Int -> Int
maxi x y 
 | x >= y = x 
 | otherwise = y

maximoVendas :: Int -> Int 
maximoVendas n 
 | n == 0 = vendas 0
 | otherwise = maxi (maximoVendas (n-1)) (vendas n)

 {--
maximoVendas 3 
= maxi (maximoVendas (2)) (vendas 3)
= maxi (maxi maximoVendas (1) vendas 2) (vendas 3)
= maxi (maxi (maximoVendas (0) vendas 1) vendas 2) (vendas 3)
= maxi (maxi (vendas (0) vendas 1) vendas 2) (vendas 3)
 --}

quadrado x = x
 * x

inc x = x + 
 1

soma x y = x + y