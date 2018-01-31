module Determinant where

main :: IO()
main = do
  let a = [1,2,3]
  print $ sgnpermut a
  let b = [1,3,2]
  print $ sgnpermut b
  let c = [[1,2,3],[4,5,6],[7,8,9]]
  print $ det c

type Column = [Double]
type Matrix = [Column]

sgnpermut :: Column -> Double
sgnpermut (x:xs) | xs/=[] && x<head xs = sgnpermut xs
                 | xs/=[] && x>head xs = -sgnpermut xs
                 | xs/=[] && x==head xs = 0
                 | xs==[] = 1

--permutation :: Column -> Matrix
--permutation col =
--  where l = length col

cofactor :: Int -> Matrix -> Matrix
cofactor n mat = map tail (dropAt n mat)

dropAt :: Int -> Matrix -> Matrix
dropAt n mat | n/=(length mat-1) =  ys ++ tail zs
             | otherwise = take n mat
             where (ys,zs) = splitAt n mat

minor :: Int -> Matrix -> Double
minor n [[a]] = a
minor n mat   = (-1)^n * head (mat!!n) * foldr (+) 0 [minor m mat2 | m <- [0..(length mat2 - 1)]] where mat2 = cofactor n mat

det :: Matrix -> Double
det mat = foldr (+) 0 [minor n mat | n <- [0..(length mat - 1)]]
