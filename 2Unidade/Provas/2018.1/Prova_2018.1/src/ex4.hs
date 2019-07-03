import Control.Concurrent
import Control.Concurrent.STM


type Buffer meuBuffer = TVar [meuBuffer]

newBuffer :: [meuBuffer] -> IO (Buffer meuBuffer)
newBuffer = newTVarIO

get :: Buffer meuBuffer -> STM meuBuffer
get buffer = do
    meuBuffer <- readTVar buffer
    if null meuBuffer
        then retry
        else return (head meuBuffer)

put :: Buffer meuBuffer -> meuBuffer -> STM()
put buffer meuBuffer = do
    conteudo <- readTVar buffer
    writeTVar buffer (meuBuffer:conteudo)

produtor :: Buffer Int -> Int -> IO ()
produtor buffer meuBuffer = do
    threadDelay 1000000
    atomically (put buffer meuBuffer)
    produtor buffer (meuBuffer + 1)

consumidor :: Buffer Int -> IO ()
consumidor buffer = do
    threadDelay 500000
    a <- atomically (get buffer)
    print a
    consumidor buffer

main :: IO()
main = do
    buffer <- newBuffer []
    forkIO $ consumidor buffer
    forkIO $ produtor buffer 0
    readLn