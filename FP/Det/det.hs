module Determinant where

main :: IO()
main = do
  let c = [[1,2,3],[4,5,6],[7,8,9]]
  print $ det c

type Column = [Double]
type Matrix = [Column]

-- minorM = minor Matrix
minorM :: Int -> Matrix -> Matrix
minorM n mat = map tail (dropAt n mat)

dropAt :: Int -> Matrix -> Matrix
dropAt n mat | n/=(length mat-1) =  ys ++ tail zs
             | otherwise = take n mat
             where (ys,zs) = splitAt n mat

-- pw : piecewise
pwDet :: Int -> Matrix -> Double
pwDet n [[a]] = a
pwDet n mat   = (-1)^n * head (mat!!n) * foldr (+) 0 [pwDet m mat2 | m <- [0..(length mat2 - 1)]] where mat2 = minorM n mat

det :: Matrix -> Double
det mat = foldr (+) 0 [pwDet n mat | n <- [0..(length mat - 1)]]
