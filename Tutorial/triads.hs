module Main (main) where

main :: IO ()
main = print (triads 100)

triads :: Int -> [(Int, Int, Int)]
triads n =
  [ (x, y, z)
  | x <- [1 .. n]
  , y <- [1 .. n]
  , z <- [1 .. n]
  , x ^ 2 + y ^ 2 == z ^ 2
  ]
