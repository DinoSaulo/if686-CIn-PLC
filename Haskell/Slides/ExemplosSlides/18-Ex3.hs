module Main where
--import Control.Parallel
import Control.Concurrent
import Control.Concurrent.MVar

waitThreads :: MVar Int -> IO()
waitThreads fim = do
    f <- takeMVar fim
    if (f > 0) then
        do putMVar fim f
            waitThreads fim
    else
        return ()

main :: IO ()
main = do
        contador <- newMVar 0
        fim <- newMVar 2
        forkIO (oper (+) contador fim 100000)
        forkIO (oper (-) contador fim 100000)
        waitThreads fim
    return ()