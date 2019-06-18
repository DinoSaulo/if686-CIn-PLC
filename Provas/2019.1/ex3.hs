-- Aluno Saulo Alexandre de Barros (SAB2)
-- Não consegui implementar tudo devido ao tempo mas o programa contem a lógica que idealizei para a execução do mesmo
import Control.Concurrent
import Control.Concurrent.STM


type Buffer meuSanduiche = TVar [meuSanduiche]

newBuffer :: [meuSanduiche] -> IO (Buffer meuSanduiche)
newBuffer = newTVarIO

get :: Buffer meuSanduiche -> STM meuSanduiche
get buffer = do
    meuSanduiche <- readTVar buffer
    if null meuSanduiche
        then retry
        else return (head meuSanduiche)

put :: Buffer meuSanduiche -> meuSanduiche -> STM()
put buffer meuSanduiche = do
    sanduiche <- readTVar buffer
    writeTVar buffer (meuSanduiche:sanduiche)

produtor :: Buffer Int->Buffer Int->Buffer Int->Buffer Int->IO ()
produtor buffer meuSanduiche = do
    threadDelay 1000000
    atomically (put buffer meuSanduiche)
    produtor buffer (meuSanduiche)

consumidor1 :: Buffer Int->Buffer Int->Buffer Int->Buffer Int->IO()
consumidor faca pao tomate carne = do
    threadDelay 500000
    a1 <- atomically (get faca)
    a2 <- atomically (get pao)
    a3 <- atomically (get tomate)
    a4 <- atomically (get carne)
    print("O produtor 1 estah fazendo o senduiche") 
    consumidor buffer

consumidor2 :: Buffer Int->Buffer Int->Buffer Int->Buffer Int->IO()
consumidor faca pao tomate carne = do
    threadDelay 700000
    a1 <- atomically (get faca)
    a2 <- atomically (get pao)
    a3 <- atomically (get tomate)
    a4 <- atomically (get carne)
    print("O produtor 2 estah fazendo o senduiche")
    consumidor buffer

main :: IO()
main = do
    buffer <- newBuffer []
    forkIO $ consumidor1 buffer
    forkIO $ consumidor2 buffer
    forkIO $ produtor buffer 30
    readLn