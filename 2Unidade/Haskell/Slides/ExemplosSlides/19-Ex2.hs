module Main where
--import Control.Parallel
import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM

waitThreads :: MVar Int -> IO()
main::IO()
main = do
    bal <- atomically (newTVar 0.0)
    invest <- atomically (newTVar 0.0)
    fim <- newMVar 2
    forkIO (makeInvestment bal invest fim)
    forkIO (incrementBalance bal fim)
    waitThreads fim
    e <- atomically (readTVar bal)
    f <- atomically (readTVar invest)
    putStr ("Balance: " ++ show e ++ "\n")
    putStr ("Investment: " ++ show f ++ "\n")

incrementBalance :: TVar Float -> MVar Int -> IO ()
incrementBalance tvb fim = do
    atomically(ib tvb)
    f <- takeMVar fim
    putMVar fim (f-1)

ib :: TVar Float -> STM ()
ib tvb = do
    y <- readTVar tvb
    if y < 10000
    then do{ writeTVar tvb (y + 1);
        ib tvb;
    }
    else return ()

makeInvestment :: TVar Float -> TVar Float -> MVar Int -> IO()
makeInvestment bal inv fim = do
    atomically(
        do
            a <- readTVar bal
            if a < 1000
            then retry --condição não satisfeita
            else do {
                writeTVar inv 1000;
                writeTVar bal (a - 1000);
            }
        )
    f <- takeMVar fim
    putMVar fim (f-1)