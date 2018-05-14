import Data.List (words, group, sort)

main :: IO ()
main = do
  print $ words "Hello, my name is tae-geun kim"
  print $ group ["boom", "bip", "bip", "boom", "boom"]
  print $ sort [5,4,3,7,2,1]
  print $ wordNums "wa wa wee wa"

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words
