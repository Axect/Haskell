module Split where

splitLines :: String -> [String]
splitLines (x:y:xs) | y/="\n" = [x ++ head splitLines (y:xs)]
  | y=="\n" = []
