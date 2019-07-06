eXor :: Bool -> Bool -> Bool
eXor x y = ( x || y ) && not ( x && y )

eXor2 :: Bool -> Bool -> Bool
eXor2 True x = not x
eXor2 False x = x

vendas :: Int -> Int
vendas 0 = 4
vendas 1 = 0
vendas 2 = 0
vendas 3 = 2
vendas 4 = 8
vendas 5 = 9
vendas 6 = 2

vendasNulas :: Int -> Bool
vendasNulas n = ( vendas n == 0 )

vendasNulas2 :: Int -> Bool
vendasNulas2 n
 | vendas n == 0 = True
 | otherwise = False

-- funcos com char

offset = fromEnum 'A' - fromEnum 'a'

maiuscula :: Char -> Char
maiuscula ch = toEnum (fromEnum ch + offset)

ehDigito :: Char -> Bool
ehDigito ch = ( '0' <= ch ) && ( ch <= '9' )

-- Tuplas

intP :: ( Int , Int )
intP = ( 33 , 43 )

addPair :: ( Int , Int ) -> Int
addPair ( x , y ) = x + y

shift :: ( ( Int , Int ) , Int ) -> ( Int , ( Int , Int ) )
shift ( ( x , y ) , z ) = ( x , ( y , z ) )

-- Raizes

oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/ ( 2.0* a )

twoRoots :: Float -> Float -> Float -> ( Float , Float )
twoRoots a b c = (d-e , d+e )
    where
    d = -b/ ( 2.0 * a )
    e = sqrt (b^2 -4.0*a* c ) / ( 2.0 * a )

roots :: Float -> Float -> Float -> String
roots a b c
 | b^2 == 4.0 * a * c = show ( oneRoot a b c )
 | b^2 > 4.0 * a * c = show f ++ " " ++ show s
 | otherwise = "no roots"
    where ( f , s ) = twoRoots a b c

-- Sinonimos de tipos

type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age , Phone )

name :: Person -> Name
name (n, a, p) = n