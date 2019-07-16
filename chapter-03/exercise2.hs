-- exercise2.hs
module Exercise2 where

functionA :: String -> String
functionA s = s ++ "!"

functionB :: String -> Char
functionB s = s !! 4

functionC :: String -> String
functionC s = drop 9 s
