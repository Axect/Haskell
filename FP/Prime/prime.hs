module Prime where

main :: IO()
main = do
  print $ prime 10000

prime :: Int -> [Int]
prime n = [x | x <- [1..n], isPrime x]

isPrime :: Int -> Bool
isPrime n = if length (divisors n) == 1 then True else False

checkDivisor :: Int -> Int -> Bool
checkDivisor m n = if m `mod` n == 0 then True else False

divisors :: Int -> [Int]
divisors n = [x | x <- [1..(n `div` 2)], checkDivisor n x]
