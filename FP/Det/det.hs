module Determinant where

main :: IO()
main = do

type Column = [Double]
type Matrix = [Column]

det :: Matrix -> Double
det col:cols | cols/=[] = head col *
