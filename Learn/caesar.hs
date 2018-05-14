import Data.Char (ord, chr)

main :: IO ()
main = do
  print $ ord 'a'
  print $ chr 97
  print $ map ord ['a' .. 'h']
  print $ "Msg : everyone"
  print $ "Encode : " ++ encode 4 "everyone"
  print $ "Decode : " ++ decode 4 (encode 4 "everyone")

encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg
