module Main where
--import Control.Parallel
import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

main :: IO ()
main = do
    contador <- atomically (newTVar 0)
    fim <- newMVar 2
    forkIO (oper (+) contador fim 100000)
    forkIO (oper (-) contador fim 100000)
    waitThreads fim
    v <- atomically (readTVar contador)
    putStr (show v)

waitThreads :: MVar Int -> IO()
waitThreads fim = do
    f <- takeMVar fim
    if (f > 0)
    then do { putMVar fim f; waitThreads fim }
    else return ()

oper :: (Int->Int->Int) -> TVar Int ->
    MVar Int -> Int -> IO()

oper op cont fim 0 = do
    f <- takeMVar fim
    putMVar fim (f-1)

oper op cont fim num = do
    v <- atomically (readTVar cont)
    atomically (writeTVar cont (op v 1))
    oper op cont fim (num-1)