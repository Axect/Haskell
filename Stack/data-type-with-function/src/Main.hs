module Main where

main :: IO ()
main = do
  let square x = x * x
      sqrti = floor . sqrt . fromIntegral

  let squareF = Func square
      sqrtF   = Func sqrti

  let idF = compose squareF sqrtF

  putStrLn "Composing square and square root fnuctions"
  putStrLn "is an identity. Applying a value should not change it"
  print $ apply idF 3

  let x     = Ghost
      y     = Fix x
      Fix z = y

  putStrLn "Original Value is "
  print x
  putStrLn "After fixing, "
  print z

newtype Func a b = Func (a -> b)

compose :: Func a b -> Func b c -> Func a c
compose (Func f) (Func g) = Func (g . f)

apply :: Func a b -> a -> b
apply (Func f) = f

newtype Fix f = Fix (f (Fix f))

data Ghost a = Ghost deriving Show