import Data.Char

main :: IO()
main = do
  putStrLn "What level do you like memorize?"
  level <- getLine
  words <- readFile ("Wordlist/words" ++ level ++ ".txt")
  means <- readFile ("Meanlist/means" ++ level ++ ".txt")
  putStrLn "What kind of test do you like? 1:Words, 2:Means"
  test <- getLine
  case reads test :: [(Integer, String)] of
    [(1, _)] -> iterateList(wordProcess words, wordProcess means)
    [(2, _)] -> iterateList(wordProcess means, wordProcess words)
    _ -> putStrLn "Invalid Input"

-- Declare type for convenience
type Text = String
type Words = [String]

-- Split Text
splitext :: (Text, Text) -> Words
splitext (x:y, w)
  | [x]/="\n" && y/=[] = splitext(y, w ++ [x])
  | [x]=="\n" && y/=[] = w:splitext(y, [])
  | [x]=="\n" && y==[] = [w]
  | otherwise = [w++[x]]

-- Combine map toLower & Split Text
wordProcess :: Text -> Words
wordProcess txt = splitext(map toLower txt, "")

-- Iteration IO
iterateList :: (Words, Words) -> IO ()
iterateList (x:y, a:b)
  | y/=[] = do {putStrLn ("> " ++ x); line <- getLine; putStrLn a; putStrLn "" ;iterateList(y, b)}
  | y==[] = do {putStrLn ("> " ++ x); line <- getLine; putStrLn a; putStrLn "" ;putStrLn "------Finish------"}
