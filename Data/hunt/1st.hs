import Data.Char

main :: IO()
main = do
  input <- readFile "input.txt"
  print $ countWords input

countWords :: String -> [Int]
countWords input = map (length.words) (lines input)
-- words = String -> [String] (separate words)
