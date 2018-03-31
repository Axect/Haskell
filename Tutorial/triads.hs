module Main (main) where

main :: IO ()
main = print(triads 100)

triads :: Int -> [(Int, Int, Int)]
triads n = [(x,y,z) | x <- [1..z], y <- [1..z], z <- [1..n]]
