module Main where

import Data.Either

type ESInt = Either String Int

main :: IO ()
main = do
  let i = Right 10 :: ESInt
      j = Right 2  :: ESInt
      z = Right 0  :: ESInt

  putStrLn $ "Safe Division : 10/2 = " ++ (show $ safeDiv i j)
  putStrLn $ "Safe Division : 10/0 = " ++ (show $ safeDiv i z)

safeDiv :: ESInt -> ESInt -> ESInt
safeDiv (Left e)  _                  = Left e
safeDiv _         (Left  e)          = Left e
safeDiv (Right i) (Right j) | j == 0 = Left "Zero division Error!"
safeDiv (Right i) (Right j)          = Right (i `div` j)

