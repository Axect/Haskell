module LessThan where

lessThan :: Integer -> [Integer]
lessThan n = [0 .. n-1]

plusMinus :: Integer -> Integer -> [Integer]
plusMinus a b = [a+b, a-b]
