isPrime :: Int -> Bool
isPrime n | n == 1    = False
          | n <= 3    = True
          | otherwise = worker 2
 where
  worker i | fromIntegral i >= sqrt (fromIntegral n) = True
           | mod n i == 0                            = False
           | otherwise                               = worker (i + 1)

-- CAFs
primeMem :: Int -> Int
primeMem = (filter isPrime [2 ..] !!)

