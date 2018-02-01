module Determinant2 where

import Data.List

main :: IO()
main = do
  let a = [1,2,3]
  let b = [3,2,1]
  let c = [1,3,2]
  print $ map sgn [a,b,c]

type Column = [Double]
type Matrix = [Column]
type Perms  = [Column]

-- [1,2] [1,2,3] => [2,1,3]
swap :: Eq a => a -> a -> ([a] -> [a])
swap a b = map $
  \x -> if x==a then b
        else if x==b then a
        else x

-- sgn [1,2,3] = +1, sgn [2,1,3] = -1
sgn :: Column -> Double
sgn [] = 1.0
sgn (1:xs) = sgn $ map (subtract 1) xs
sgn (x:xs) = -sgn (swap 1 x (x:xs))

-- genPerm [[1,2],[3,4]] = [[1,2], [2,1]]
genPerm :: Matrix -> Perms
genPerm mat = permutations ([1..l]::Column) where l = fromIntegral $ length(mat)

-- det A = \sum_{\sigma \in S_n} sgn(\sigma) * \product_{i=1}^n a_{i,\sigma_i}
det :: Matrix -> Double
det mat = sum [sgn sig * product [mat!!i!!(sig'!!i) | i <- [0..1]] | sig <- g, let sig' = map (floor) $ map (+(-1)) sig]
  where g = genPerm mat -- [[Double]]
        l = length (mat)
