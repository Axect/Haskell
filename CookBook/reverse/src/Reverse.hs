module Reverse where

import Prelude hiding (reverse)

main :: IO ()
main = do
  let inp = [1 .. 10]
      rs  = reverse inp
  putStrLn $ "Reverse of " ++ show inp ++ " is " ++ show rs


reverse :: [a] -> [a]
reverse xs = reverse' xs []
 where
  reverse' :: [a] -> [a] -> [a]
  reverse' xs rs = foldl (flip (:)) rs xs
