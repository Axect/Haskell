main = do
  print $ quickSort [5, 1, 9, 4, 6, 7, 3]

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) =
  (quickSort . (filter (x >=))) xs ++ [x] ++ (quickSort . (filter (x <))) xs
