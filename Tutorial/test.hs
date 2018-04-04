module Test where

main :: IO ()
main = do
  let a = Vector [1, 2, 3]
  print a


double x = x + x
quadruple x = double (double x)

factorial n = product [1 .. n]
avg ns = sum ns `div` length ns
-- x `div` y is syntatic sugar of div x y

add :: (Int, Int) -> Int
add (x, y) = x + y

zeroto :: Int -> [Int]
zeroto n = [0 .. n]

test :: IO ()
test = print ([1, 2, 3] `zip` ['a', 'b', 'c'])

combination :: Int -> Int -> Int
combination a b | a >= b = factorial a `div` (factorial b * factorial (a - b))

abs n | n >= 0    = n
      | otherwise = -n

signum n | n > 0     = 1
         | n < 0     = -1
         | otherwise = 0
