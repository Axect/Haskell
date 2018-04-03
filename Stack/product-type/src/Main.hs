module Main where

main :: IO ()
main = do
  putStrLn "hello world"

data Product1     = Product1 Bool deriving Show
data Product2     = Product2 Bool Bool deriving Show
data Product3 a   = Product3 a Bool deriving Show
data Product4 a b = Product4 a b deriving Show

