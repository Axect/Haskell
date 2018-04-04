module Main (main) where

main :: IO ()
main = print x print (reverseC x)

x = [ factorial x | x <- [1 .. 5] ]

factorial 0 = 1
factorial n = n * factorial (n - 1)

productC :: [Int] -> Int
productC [] = 1
productC ns = foldr (*) 1 ns
-- productC (n:ns) = n * productC ns

lengthC :: [a] -> Int
lengthC []     = 0
-- lengthC ns = foldr (\n -> (+) 1) 0 ns
lengthC (n:ns) = 1 + lengthC ns

reverseC :: [a] -> [a]
reverseC []     = []
reverseC (n:ns) = reverseC ns ++ [n]
