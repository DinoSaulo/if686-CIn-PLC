module Main where

import Control.Concurrent
import Control.Concurrent.MVar


waitThreads :: MVar Int -> IO ()
waitThreads fim =
  do f <- takeMVar fim
     if (f > 0) then
       do putMVar fim f
          waitThreads fim
     else
        return ()

bulbMachine :: MVar Int -> IO ()
bulbMachine bulb =
    do 
        b <- takeMVar bulb
        putMVar bulb (b+1)
        bulbMachine bulb

sktMachine :: MVar Int -> IO ()
sktMachine skt = 
    do 
        s <- takeMVar skt
        putMVar skt (s+1)
        sktMachine skt

pckMachine :: MVar Int -> IO ()
pckMachine pck =
    do 
        p <- takeMVar pck
        putMVar pck (p+1)
        pckMachine pck

lampMachine :: MVar Int -> MVar Int -> MVar Int -> MVar Int -> MVar Int -> IO ()
lampMachine lamp bulb skt pck fim = do 
                                        b <- takeMVar bulb
                                        s <- takeMVar skt
                                        p <- takeMVar pck
                                        l <- takeMVar lamp
                                        f <- takeMVar fim
                                        if (b > 0 && s > 0 && p > 0)
                                            then
                                                do
                                                    putMVar bulb (b-1)
                                                    putMVar skt (s-1)
                                                    putMVar pck (p-1)
                                                    putMVar lamp (l+1)
                                            else
                                                do
                                                    putMVar bulb (b)
                                                    putMVar skt (s)
                                                    putMVar pck (p)
                                                    putMVar lamp (l)
                                        if (l == 50)
                                            then
                                                putMVar fim (f - 1)
                                            else
                                                putMVar fim (f)
                                        lampMachine lamp bulb skt pck fim


main = do
        lamps <- newMVar 0
        bulbs <- newMVar 0
        sockets <- newMVar 0
        pcks <- newMVar 0
        fim <- newMVar 1
        forkIO(bulbMachine bulbs)
        forkIO(sktMachine sockets)
        forkIO(pckMachine pcks)
        forkIO(lampMachine lamps bulbs sockets pcks fim)
        forkIO(lampMachine lamps bulbs sockets pcks fim)
        waitThreads(fim)
        l <- takeMVar lamps
        putStrLn("Lamps: " ++ show l)




