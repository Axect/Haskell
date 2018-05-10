main = do
  print $ maximum [1, 3, 2, 4, 1]

maximum' :: (Ord a) => [a] -> a
maximum' []     = error "Maximum of empty list!"
maximum' [x   ] = x
maximum' (x:xs) = max x (maximum' xs)

replicate' :: Int -> a -> [a]
replicate' n x | n <= 0    = []
               | otherwise = x : replicate' (n - 1) x

take' :: Int -> [a] -> [a]
take' n _ | n <= 0 = []
take' _ []         = []
take' n (x:xs)     = x : take' (n - 1) xs

reverse' :: [a] -> [a]
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [a] -> [(a, a)]
zip' []     _      = []
zip' _      []     = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

elem' :: a -> [a] -> Bool
elem' _ [] = False
elem' x (y:ys) | x == y    = True
               | otherwise = elem' x ys
