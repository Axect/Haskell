main = do
  print $ Red == Red
  print $ Red == Yellow
  print $ Red `elem` [Red, Yellow, Green]
  print $ [Red, Yellow, Green]

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

instance Show TrafficLight where
  show Red = "Red Light"
  show Green = "Green Light"
  show Yellow = "Yellow Light"

