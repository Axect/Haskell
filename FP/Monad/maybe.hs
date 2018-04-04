square :: Integer -> Maybe Integer
square n | 0 <= n    = Just (n * n)
         | otherwise = Nothing

squareRoot :: Integer -> Maybe Integer
squareRoot n | 0 <= n    = squareRoot' 1
             | otherwise = Nothing
 where
  squareRoot' x | n > x * x = squareRoot' (x + 1)
                | n < x * x = Nothing
                | otherwise = Just x

squareAndSquareRoot1 :: Integer -> Maybe Integer
squareAndSquareRoot1 n = case square n of
  Nothing -> Nothing
  Just nn -> squareRoot nn

squareAndSquareRoot' :: Integer -> Maybe Integer
squareAndSquareRoot' n = do
  nn <- square n
  squareRoot nn

squareAndSquareRoot1' :: Integer -> Maybe Integer
squareAndSquareRoot1' n = square n >>= squareRoot
