import Network.HTTP

main = do
  putStrLn "Input Url"
  url <- getLine
  a <- get url
  putStrLn a

get :: String -> IO String
get url = simpleHTTP (getRequest url) >>= getResponseBody

getCode :: String -> IO ResponseCode
getCode url = simpleHTTP req >>= getResponseCode
  where req = getRequest url
