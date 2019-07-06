-- 1

--a

-- esta funcao conta quantas vesse um inteiro se repete em uma lista
count :: Eq a => Integral b => a -> [a] -> b
count e = sum . map (\a -> if a == e then 1 else 0)

f :: [Int] -> [Int]
f [] = []
f (x:xs)
 | ((count x xs) > 0 && (x > 1)) = [x] ++ f xs
 | otherwise = f xs


--b

f2 :: [Int] -> [Int]
f2 arr = [ i | (i, j) <- (zip arr (drop 1 arr)), i == j]

ar = [1,2,2,3,1]