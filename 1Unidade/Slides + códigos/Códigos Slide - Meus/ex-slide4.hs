maxi :: Int -> Int -> Int
maxi n m | n >= m = n
         | otherwise = m

maxFun :: ( Int -> Int ) -> Int -> Int
maxFun f 0 = f 0
maxFun f n = maxi ( maxFun f (n-1 ) ) ( f n)

zeroInRange :: ( Int -> Int ) -> Int -> Bool
zeroInRange f 0 = ( f 0 == 0 )
zeroInRange f n = zeroInRange f (n-1) || ( f n == 0 )

inc :: Int -> Int
inc x = x - 1

times2 :: Int -> Int
times2 n = 2 * n

ehDigito :: Char -> Bool
ehDigito ch = ( '0' <= ch ) && ( ch <= '9' )

double :: [ Int ] -> [ Int ]
double [] = []
double ( a : x ) = ( 2 * a ) : double x

sqrList :: [ Int ] -> [ Int ]
sqrList [] = []
sqrList ( a : x ) = ( a*a ) : sqrList x

mapx :: ( t -> u ) -> [ t ] -> [ u ]
mapx f [] = []
mapx f ( a : as ) = (f a) : (mapx f as)

-- folding --

sumList :: [ Int ] -> Int
sumList [] = 0
sumList (a : as) = a + sumList as

foldx :: ( t -> t -> t ) -> [ t ] -> t
foldx f [ a ] = a
foldx f ( a : as ) = f a ( foldx f as )

andx :: [ Bool ] -> Bool
andx xs = foldx (&&) xs

concat :: [ [ t ] ] -> [ t ]
concat xs = foldx ( ++ ) xs

maximum :: [ Int ] -> Int
maximum xs = foldx maxi xs

-- filtros --

isPositive :: Int -> Bool
isPositive a
 | a>0 = True
 | otherwise = False

filterx :: ( t -> Bool ) -> [ t] -> [ t ]
filterx p [ ] = [ ]
filterx p ( a : as )
 | p a = a : filterx p as
 | otherwise = filterx p as
