main = do
  let listOfFuns = map (*) [0 ..]
  print $ listOfFuns !! 3 $ 5
  print $ map ($ 3) (take 5 listOfFuns)
