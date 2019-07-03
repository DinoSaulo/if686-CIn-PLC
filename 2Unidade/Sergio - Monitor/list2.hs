mdc :: Int -> Int -> Int
mdc 0 _ = -1
mdc a b
    | a >= b = last [x | x <- [1..a], a `mod` x == 0 && b `mod` x == 0]
    | otherwise = last [x | x <- [1..b], a `mod` x == 0 && b `mod` x == 0]

isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime a = a == last (eratosthenes [2..a])
    where
    eratosthenes :: [Int] -> [Int]
    eratosthenes [] = []
    eratosthenes (i:j) = i : (eratosthenes (filter (\x -> mod x i /= 0) j))

type Point = (Double, Double, Double)

distance :: Point -> Point -> Double
distance (xA, yA, zA) (xB, yB, zB) = sqrt ((xA - xB)**2 + (yA - yB)**2 + (zA - zB)**2)

powSum :: Int -> [Int]
powSum a = [x * x | x <- [1..a]]

grid :: Int -> Int -> [(Int, Int)]
grid m n = [(x, y) | x <-[0..m], y <- [0..n]]

square :: Int -> [(Int, Int)]
square n = [x | x <- grid n n, fst x /= snd x]

merge :: Ord a => [a] -> [a] -> [a]
merge a [] = a
merge [] b = b
merge (a:z) (x:xs)
    | a < x = a : merge z (x:xs)
    | otherwise = x : merge (a:z) xs

halve :: [a] -> ([a],[a])
halve a = splitAt (length a `div` 2) a

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort a = merge (msort (fst (halve a))) (msort (snd (halve a)))

applyFunc :: [Int->Int] -> [Int] -> [[Int]]
applyFunc [] _ = []
applyFunc (f:fs) l = [f x | x <- l ] : applyFunc fs l

data WeekDay = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Eq, Ord, Show, Enum)

orderDay :: [WeekDay] -> [WeekDay]
orderDay [] = []
orderDay [a] = [a]
orderDay (x:xs) = orderDay [y | y<-xs, y <= x] ++(x : orderDay [y | y<-xs, y > x])

sameDate :: [(WeekDay, Int)] -> WeekDay -> [Int]
sameDate [] _ = []
sameDate (x:xs) d
        | fst x == d = snd x : sameDate xs d
        | otherwise = sameDate xs d

printMonth :: WeekDay -> [(Int, WeekDay)]
printMonth d = [([1..30]!!i, [Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday]!!((fromEnum d + i) `mod` 7)) | i <- [0..29]]
