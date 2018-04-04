module Msort
where

group2 :: Ord a => [a] -> [[a]]
group2 []           = []
group2 [x         ] = [[x]]
group2 (x : y : xs) = sortPair x y : group2 xs
  where
    sortPair x y | x >= y    = [y, x]
                 | otherwise = [x, y]

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x : xs) (y : ys) | x >= y    = y : merge (x : xs) ys
                        | otherwise = x : merge xs (y : ys)

mergeSort :: Ord a => [a] -> [a]
mergeSort xs = mergeSort' (group2 xs)
  where
    mergeSort' :: Ord a => [[a]] -> [a]
    mergeSort' []   = []
    mergeSort' [xs] = xs
    mergeSort' xss  = mergeSort' (mergeStep' xss)
    mergeStep' :: Ord a => [[a]] -> [[a]]
    mergeStep' []              = []
    mergeStep' [xs           ] = [xs]
    mergeStep' (xs : ys : xss) = merge xs ys : mergeStep' xss

