module Main where
--import Control.Parallel
import Control.Concurrent
import Control.Concurrent.MVar

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

--fibThread :: Int -> MVar Int -> IO()
--fibThread n resMVar = putMVar resMVar (fib n)

fibThread :: Int -> MVar Int -> IO ()
fibThread n resMVar =
    pseq f (putMVar resMVar f)
    where f = fib n

mkList :: Int -> [Int]
mkList n = [1..n-1]

relprime :: Int -> Int -> Bool
relprime x y = (gcd x y == 1)

euler :: Int -> Int
euler n = length (filter (relprime n) (mkList n))

sumEuler :: [Int] -> Int
sumEuler l = sum $ map euler l

s1 :: Int
s1 = sumEuler (mkList 4750)

main :: IO ()
main = do
    putStrLn "explicit SumFibEuler"
    fibResult <- newEmptyMVar
    forkIO (fibThread 37 fibResult)
    --pseq s1 (return ())
    f <- takeMVar fibResult
    putStrLn ("sum: " ++ show (s1+f))