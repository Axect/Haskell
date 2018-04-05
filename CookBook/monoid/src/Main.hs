module Main where

main :: IO ()
main = do
  putStrLn "Define default options"
  let defaultOptions = mempty :: Option
  print defaultOptions
  let option1 = defaultOptions `mappend` Option True []
      option2 = option1 `mappend` Option False ["Haskell"]
      option3 = option2 `mappend` Option True ["CookBook"]

  putStrLn $ "Adding True flag - " ++ show option1
  putStrLn $ "Adding False flag, and selection \"Haskell\" - " ++ show option2
  putStrLn $ "Adding True flag, and selection \"CookBook\" -" ++ show option3
  putStrLn "Concatenating all options"
  putStrLn $ "Concatenation Result - " ++ show
    (mconcat [defaultOptions, option1, option2])


-- Monoid has two properties
-- 1. There is a default or empty value of the data type.
-- 2. Given two values of the data type, they can be combined to create a single value.

data Option = Option { boolOption :: Bool
                     , selections :: [String]
                     }
                     deriving Show

instance Monoid Option where
  mempty = Option False []
  (Option b1 s1) `mappend` (Option b2 s2) = Option (b1 || b2) (s1 ++ s2)

