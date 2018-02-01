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

swap a b = map $
  \x -> if x==a then b
        else if x==b then a
        else x


sgn :: Column -> Double
sgn [] = 1.0
sgn (1:xs) = sgn $ map (subtract 1) xs
sgn (x:xs) = -sgn (swap 1 x (x:xs))

