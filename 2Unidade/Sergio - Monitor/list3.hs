import Data.Char

sortOrd :: (a->a->Bool)->[a]->[a]
sortOrd _ [] = []
sortOrd _ [x] = [x]
sortOrd f (x:xs) = sortOrd f [y | y <-xs, f y x] ++ (x : sortOrd f [y | y <-xs, f x y])

group :: Eq a => [a] -> [[a]]
group [] = []
group [x] = [[x]]
group (x:xs) = [y | y<-(x:xs), y == x] : group (filter (\i -> i /= x) xs)

type Edge = Float
type Triangle = (Edge,Edge,Edge)

areaSum :: [Triangle] -> Float
areaSum [] = 0
areaSum l = foldr1 (+) (map area l)
        where
            area :: Triangle -> Float
            area (x,y,z) = sqrt (((x+y+z)/2) * ((x+y+z)/2 - x) * ((x+y+z)/2 - y) * ((x+y+z)/2 - z))

functions :: [(a -> a -> a)] -> [a] -> [(a -> a)]
functions [] _ = []
functions _ [] = []
functions (x:xs) (y:ys) = x y : functions xs ys

-- abrev :: [[Char]] -> [[Char]]
-- abrev [] = []
-- abrev (x:xs) = [x!!0:'.':' ' : last (splitOn ' ' x)] ++ abrev xs
--         where
--         	splitOn :: Char -> [Char] -> [[Char]]
--         	splitOn _ [] = []
--         	splitOn c (x:xs)
--                     | c == x = [] : splitOn c xs
--                     | otherwise = (x: head (splitOn c xs)) : tail (splitOn c xs)
