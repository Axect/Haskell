import           Data.List                      ( foldl' )

sum' = foldl' (+) 0

mean :: [Double] -> Double
mean v = sum' v / fromIntegral (length v)

--cov :: [Double] -> [Double] -> Double
--cov xs ys = sum' (zipWith (\x y -> (x - mean xs) * (y - mean ys)) xs ys)
--  / fromIntegral (length xs)
cov' :: [Double] -> [Double] -> Double
cov' xs ys =
  let mx = mean xs
      my = mean ys
  in  sum' (zipWith (\x y -> (x - mx) * (y - my)) xs ys)
        / fromIntegral (length xs)

main = do
  let xs = [1, 1.1 .. 500]
      ys = [2, 2.1 .. 501]
  print $ cov' xs ys
