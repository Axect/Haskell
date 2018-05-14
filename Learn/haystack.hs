import Data.List (tails, isPrefixOf)

main :: IO ()
main = do
  print $ "hawaii" `isPrefixOf` "hawaii joe"
  print $ any (=='F') "Frank Sobotka"
  print $ "xe" `isIn` "Axect"

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)
