module Main where

main :: IO ()
main = do
  putStrLn "Enumerating months"
  putStrLn $ show [January .. December]
  putStrLn "Enumerating odd months"
  putStrLn $ show [January, March .. December]
  putStrLn $ "Equating months, January with itself : " ++ (show $ January == January)

data Month = January | February | March | April | May | June | July | August | September | October | November | December deriving Show

instance Enum Month where
  toEnum 0           = January
  toEnum 1           = February
  toEnum 2           = March
  toEnum 3           = April
  toEnum 4           = May
  toEnum 5           = June
  toEnum 6           = July
  toEnum 7           = August
  toEnum 8           = September
  toEnum 9           = October
  toEnum 10          = November
  toEnum 11          = December
  toEnum n           = toEnum $ n `mod` 12

  fromEnum January   = 0
  fromEnum February  = 1
  fromEnum March     = 2
  fromEnum April     = 3
  fromEnum May       = 4
  fromEnum June      = 5
  fromEnum July      = 6
  fromEnum August    = 7
  fromEnum September = 8
  fromEnum October   = 9
  fromEnum November  = 10
  fromEnum December  = 11

instance Eq Month where
  m1 == m2 = fromEnum m1 == fromEnum m2

instance Ord Month where
  m1 `compare` m2 = fromEnum m1 `compare` fromEnum m2

