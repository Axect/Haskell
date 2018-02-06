{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}
import Database.MongoDB

main :: IO()
main = do
  let db = "test"
  pipe <- runIOE $ connect (host "127.0.0.1")
  e <- access pipe master db run
  close pipe
  print e

run = getData
getData = rest =<< find (select [] "people") {sort=[]}
