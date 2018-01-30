main :: IO()
main = do
  let result = [x | x <- [1..10000000], checkMod x]
  print $ result

eval :: [Integer] -> Integer
eval (x:xs) | xs/=[] = 10^length(xs) * x + eval(xs)
            | xs==[] = x

rev :: [Integer] -> [Integer]
rev xs = tail xs ++ [head xs]

mod' :: Integer -> [Integer]
mod' n | n>=10 = n `mod` 10 : mod' (n `div` 10)
       | n < 10 = [n]

checkMod :: Integer -> Bool
checkMod n = eval (reverse $ mod' n) == 2 * (eval $ rev (reverse $ mod' n))
