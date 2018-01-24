import Control.Monad.Trans.Maybe
import Network.HTTP
import Network.URL
import Test.XML.HXT.ARROW

openUrl :: String -> MaybeT String IO
openUrl url = case parseURI url of
                Nothing -> fail ""
                Just u -> liftIO (getResponseBody =<< simpleHTTP (mkRequest GET u))

css ::

