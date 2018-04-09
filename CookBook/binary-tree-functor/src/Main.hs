module Main where

import Data.Functor

main :: IO ()
main = do
  putStrLn "hello world"

data Tree a = Leaf
            | Node (Tree a) a (Tree a)
            deriving (Show, Eq)

node :: Tree a -> a -> Tree a -> Tree a
node l x r = Node l x r

singleton :: a -> Tree a
singleton x = Node Leaf x Leaf

instance Functor Tree where
  fmap _ Leaf = Leaf
  fmap f (Node left value right) = Node (fmap f left) (f value) (fmap f right)



