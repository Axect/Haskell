module Main
where

import Data.Maybe

main :: IO ()
main = do
  let i = Just 10 :: Maybe Int
      j = Just 2 :: Maybe Int
      z = Just 0 :: Maybe Int
  putStrLn $ "Does (Just 10) represent a value? " ++ (show $ isJust i)
  putStrLn $ "Does (Nothing) represent a value? " ++ (show $ isJust Nothing)
  putStrLn $ "Does (Nothing) is really Nothing? " ++ (show $ isNothing Nothing)

  putStrLn ""
  putStrLn $ "Singleton List and Maybe interoperability"
  putStrLn $ "Converting list [10] to Maybe : " ++ (show $ listToMaybe [10])
  putStrLn $ "Converting empty list to Maybe (Nothing) : " ++ (show $ (listToMaybe [] :: Maybe Int))
  putStrLn $ "Converting Maybe (Just 10) to List : " ++ (show $ (maybeToList (Just 10)))
  putStrLn $ "Converting Maybe (Nothing) to List : " ++ (show $ (maybeToList (Nothing :: Maybe Int)))
 
  putStrLn $ ""
  putStrLn $ "Using default value for a transformation using 'maybe'"
  putStrLn $ "Use Null if Nothing, and convert a value to string if Maybe holds a value"
  let defaultNull = "NULL"
      convertToString = maybe defaultNull show
      null = convertToString Nothing
      something = convertToString (Just 10)
  putStrLn $ "Converting Nothing to String : " ++ null
  putStrLn $ "Converting a value to String : " ++ something
