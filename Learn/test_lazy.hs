main = do
  print $ foldl (+) 0 (replicate 10000000 1)
