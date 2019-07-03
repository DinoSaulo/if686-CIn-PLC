import Data.Char

xor :: Bool -> Bool -> Bool
xor x y 
   | x == y = False
   | otherwise = True

exOr :: Bool -> Bool -> Bool
exOr True True = False
exOr True False = True
exOr False True = True
exOr False False = False

nAnd :: Bool -> Bool -> Bool
nAnd True True = False
nAnd _ _ = True

nAnd2 :: Bool -> Bool -> Bool
nAnd2 x y
    | x == False = True
    | y == False = True
    | otherwise = False

upperCase :: Char -> Char
upperCase x
    | (ord x >= ord 'a') && (ord 'z' >= ord x) = chr (ord x - 32)
    | otherwise = x

charToNum :: Char -> Int
charToNum x
    | (ord x >= ord '0') && (ord '9' >= ord x) = ord x - ord '0'
    | otherwise = -1