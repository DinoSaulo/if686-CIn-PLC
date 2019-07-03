rept :: [Int] -> [Int]
rept [] = []
rept [x] = []
rept (x:y:xs)
        | x==y = x : rept (y:xs)
        | otherwise = rept (y:xs)


rept2 :: [Int] -> [Int]
rept2 l = [l!!x | x <- [0..(length l) - 2], l!!x == l!!(x+1)]

