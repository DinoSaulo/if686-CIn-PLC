-- 19/fev

constante :: Int
constante  = 30

maior :: Bool
maior = constante > 40

yes :: Bool
yes = True

funcaoComUmArgumento :: Int -> Bool
funcaoComUmArgumento x = x > 50

quadrado :: Int -> Int
quadrado x = x * x
  

todosIguais :: Int -> Int -> Int -> Bool
todosIguais x y z = (x == y) && (y == z)

-- Uma funcao com guardas 

maxi :: Int -> Int -> Int
maxi x y
 | x >= y = x      -- guarda (exp booleana) = expr 
 | otherwise = y 