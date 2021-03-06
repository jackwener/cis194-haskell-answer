{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -fno-warn-missing-methods #-}

{-# LANGUAGE FlexibleInstances #-}

module Fibonacci where


-- Ex.1

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib (n-2)

fibs1 :: [Integer]
fibs1 = fmap fib [0..]

-- Ex.2

fibs2 :: [Integer]
fibs2 = 0 : 1 : zipWith (+) fibs2 (tail fibs2)

{- recommond to see the discussion of the question -}
{- https://stackoverflow.com/questions/1105765/generating-fibonacci-numbers-in-haskell -}

-- Ex.3

data Stream a = Cons a (Stream a)

instance Show a => Show (Stream a) where
  show = show . take 20 . streamToList

streamToList :: Stream a -> [a]
streamToList (Cons y c) = y : streamToList c
