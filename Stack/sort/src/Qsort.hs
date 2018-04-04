module Qsort
where

qsort :: Ord a => [a] -> [a]
qsort []       = []
qsort (x : xs) = qsort ys ++ [x] ++ qsort zs
  where
    ys = filter (< x) xs
    zs = filter (>= x) xs
