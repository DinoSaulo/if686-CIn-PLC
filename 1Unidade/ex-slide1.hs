-- Questoes do primeiro slide

square :: Int -> Int
square x = x * x

allEqual :: Int -> Int -> Int -> Bool
allEqual n m p = (n == m) && (m == p)

maxi :: Int -> Int -> Int
maxi n m | n >= m = n
         | otherwise = m

totalVendas :: Int -> Int
totalVendas n
 | n == 0 = vendas 0
 | otherwise = totalVendas (n-1) + vendas n

-- Exemplo da funcao vendas
vendas :: Int -> Int
vendas 0 = 0
vendas 1 = 10
vendas 2 = 20
vendas 3 = 30

maxVendas :: Int -> Int
maxVendas n
 | n == 0 = vendas 0
 | otherwise = maxi ( maxVendas (n-1) )( vendas n)

-- Casamento de Padroes

myNot :: Bool -> Bool
myNot True = False
myNot False = True

myOr :: Bool -> Bool -> Bool
myOr True x = True
myOr False x = x

myAnd :: Bool -> Bool -> Bool
myAnd False x = False
myAnd True x = x

-- tira o quadrado dos numeros e soma
sumSquares :: Int -> Int -> Int
sumSquares x y = sqX + sqY
    where sqX = x * x
          sqY = y * y

sumSquares2 :: Int -> Int -> Int
sumSquares2 x y = sq x + sq y
    where sq z = z * z

sumSquares3 :: Int -> Int -> Int
sumSquares3 x y = let sqX = x * x
                      sqY = y * y
                  in sqX + sqY