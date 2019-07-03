nFatorial :: Int -> [Int]
nFatorial 0 = [1]
nFatorial n = [foldr1 (*) [1..x] | x <- [1..n]]

tryList :: (a -> Bool) -> [a] -> Bool
tryList _ [] = True
tryList f (x:xs) = f x && tryList f xs

tryList2 :: (a -> Bool) -> [a] -> Bool
tryList2 f l = and (map f l)

tryList3 :: (a -> Bool) -> [a] -> Bool
tryList3 f l = foldr (&&) True (map f l)

type Name = String
type Content = String
data File = SmpFile Name Content | Dir Name [File]
instance Eq File where
    (SmpFile x y) == (SmpFile z w) = x == z && y == w
    (Dir x y) == (Dir z w) = x == z && y == w
    _ == _ = False
instance Show File where
    show (SmpFile x y) =  x
    show (Dir x y) =  x

fileName :: File -> String
fileName f = show f

isDir :: File -> Bool
isDir (Dir n l) = True
isDir _ = False

findDir :: [File] -> Name -> Bool
findDir [] n = False
findDir (f:fs) n
        | show f == n && isDir f = True
        | otherwise = findDir fs n

cd :: [File] -> Name -> Name
cd [] _ = "dir not Found"
cd l n
    | findDir l n = n
    | otherwise = "dir not Found"

getFiles :: File -> [File]
getFiles (Dir a z) = z
getFiles _ = []

showFiles :: [File] -> [String]
showFiles [] = []
showFiles (f:fs)
        | isDir f = showFiles (getFiles f) ++ showFiles fs 
        | otherwise = show f : showFiles fs

findFile :: [File] -> Name -> Bool
findFile [] n = False
findFile (f:fs) n
        | show f == n  = True
        | otherwise = findFile fs n

mkdir :: [File] -> Name -> [File]
mkdir f n
        | findFile f n = f
        | otherwise = f ++ [Dir n []]
