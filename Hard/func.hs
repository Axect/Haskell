main :: IO()
main = do
  print $ f 2 3 -- It works
  print $ f 2.4 3 -- It works (Fractional!)
  --print $ f a b -- It doesn't work (type a /= type b)

f :: Num a => a -> a -> a
f x y = x^2 + y^2

a :: Float
a = 2.4

b :: Int
b = 3
