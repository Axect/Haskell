main = do
  print "What's your name?"
  name <- getLine
  print ("Hello " ++ name ++ "!")

