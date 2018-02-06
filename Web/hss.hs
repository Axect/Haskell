import Text.XML.HXT.Core
import Text.HandsomeSoup

main :: IO()
main = do
  let doc = fromUrl "http://nexus.yonsei.ac.kr"
  links <- runX $ doc >>> css "h3 a" ! "href"
  print links
