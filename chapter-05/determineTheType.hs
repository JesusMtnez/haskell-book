{-# LANGUAGE NoMonomorphismRestriction #-}
module DetermineTheType where

-- Exercise 1

ex1a :: Num a => a
ex1a = (* 9) 6

ex1b :: Num a => (a, [Char])
ex1b = head [(0,"doge"),(1,"kitteh")]

ex1c :: (Integer, [Char])
ex1c = head [(0 :: Integer ,"doge"),(1,"kitteh")]

ex1d :: Bool
ex1d = if False then True else False

ex1e :: Int
ex1e = length [1, 2, 3, 4, 5]

ex1f :: Bool
ex1f = (length [1, 2, 3, 4]) > (length "TACOCAT")

-- Exercise 2
x2 :: Num a => a
x2 = 5
y2 :: Num a => a
y2 = x2 + 5
w2 :: Num a => a
w2 = y2 * 10

-- Exercise 3
x3 :: Num a => a
x3 = 5
y3 :: Num a => a
y3 = x3 + 5
z3 :: Num a => a -> a
z3 y = y * 10

-- Exercise 4
x4 :: Num a => a
x4 = 5
y4 :: Num a => a
y4 = x4 + 5
f4 :: Fractional a => a
f4 = 4 / y4

-- Exercise 5
x5 :: [Char]
x5 = "Julie"
y5 :: [Char]
y5 = " <3 "
z5 :: [Char]
z5 = "Haskell"
f5 :: [Char]
f5 = x5 ++ y5 ++ z5
