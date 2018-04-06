module Main where

import Data.Functor

main :: IO ()
main = do
  putStrLn "Mapping a List"
  putStrLn $ show $ squareList [1..10]
  
  putStrLn ""
  putStrLn "Mapping Maybe"
  putStrLn "Just 10 -> Just 100"
  putStrLn $ show $ squareMaybe (Just 10)
  putStrLn "Nothing -> Nothing"
  putStrLn $ show $ squareMaybe Nothing

  putStrLn ""
  putStrLn "Mapping Either"
  putStrLn "Right 10 -> Right 10"
  putStrLn $ show $ squareEither (Right 10 :: Either String Int)
  putStrLn "Left String -> Left String"
  putStrLn $ show $ squareEither (Left "Left Value" :: Either String Int)

  let squareF = Function square
      doubleSquare = double <$> squareF

  let Function dsq = doubleSquare
  
  putStrLn "Double the Square of X"
  print $ dsq 10
  

square :: Num a => a -> a
square x = x * x

-- fmap :: (a -> b) -> f a -> f b
-- fmap f xs = f <$> xs
squareList :: Num a => [a] -> [a]
squareList xs = square <$> xs

squareMaybe :: Num a => Maybe a -> Maybe a
squareMaybe x = square <$> x

squareEither :: Num a => Either c a -> Either c a
squareEither x = square <$> x

-- Custom Data
newtype Function a b = Function (a -> b)

instance Functor (Function a) where
  f `fmap` (Function g) = Function (f.g)

double :: Num a => a -> a
double x = x + x
