-- dividedBy.hs

module DividedByFixed where

data DivideResult a =
    Result a a
  | DividedByZero deriving Show

dividedBy :: Integral a => a -> a -> DivideResult a
dividedBy num denom = go num denom 0
  where go n d count
          | d == 0 = DividedByZero
          | n < 0 = go (negate n) d count
          | d < 0 = go n (negate d) count
          | n < d = Result ((*) count $ if num*denom < 0 then (-1) else 1) n
          | otherwise = go (n - d) d (count + 1)
