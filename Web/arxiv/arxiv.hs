import Network.HTTP

get :: String -> IO String
get url = simpleHTTP (getRequest url) >>= getResponseBody
