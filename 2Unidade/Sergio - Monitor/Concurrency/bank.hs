module Main where

import Control.Concurrent
import Control.Concurrent.TVar
import Control.Concurrent.STM

type Account = TVar Int

withdraw :: Account -> Int -> STM
withdraw c i = do
	money <- readTVar(c)
	writeTVar c (money - i)
	return()

deposit :: Account -> Int -> STM
deposit c i = do
	money <- readTVar(c)
	writeTVar c (money + i)
	return()

withdraw2 :: Account -> Int -> STM
withdraw2 c i = do
	money <- readTVar(c)
	if (money < i) then
		retry
	else
		writeTVar c (money - i)
	return()

withdraw3 :: Account -> Account -> Int -> STM
withdraw3 c c2 i = orElse (withdraw2 c i) (withdraw2 c2 i)


main = do
	c1 <- atomically(newTVar 0)
	c2 <- atomically(newTVar 0)
	let a = Account c1
	let b = Account c2
	atomically(deposit a 200)
	m <- atomically(readTVar a)
	putStrLn("Balance: " ++ m)
	atomically(withdraw a 300)
	m <- atomically(readTVar a)
	putStrLn("Balance: " ++ m)
	atomically(deposit a 200)
	m <- atomically(readTVar a)
	putStrLn("Balance: " ++ m)
	atomically(withdraw2 a 200)
	m <- atomically(readTVar a)
	putStrLn("Balance: " ++ m)
	atomically(withdraw3 b a 200)
	m <- atomically(readTVar a)
	putStrLn("Balance A: " ++ m)
	m <- atomically(readTVar a)
	putStrLn("Balance B: " ++ m)

