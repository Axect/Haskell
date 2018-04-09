module Main where

import Data.Functor
import Control.Applicative

main :: IO ()
main = do
  putStrLn "hello world"

multiplyLists :: Num a => [a] -> [a] -> [a]
multiplyLists xs ys = (*) <$> xs <*> ys

tupleMaybe :: Maybe a -> Maybe b -> Maybe (a,b)
tupleMaybe x y = (,) <$> x <*> y
