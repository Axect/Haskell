-- FP in Haskell
-- author: Tae Geun Kim (Axect)
-- ver: 0.0.1
-- * If you want to execute this code, you can use tmus & vim (vim slime or haskell vim now)
-- * vim slime : C-c-c
-- * haskell vim now : ,rs
-- * I strongly recommend vim-slime

-- 1. Functions & Types
-- 함수형 프로그래밍은 명령이나 그들의 실행보다 함수를 강조하는 프로그램 설계 방법이다.
-- 함수형 프로그래밍은 문제를 엄격하고 간결하게 묘사할 수 있는 간단한 수학적 Notation 을 사용한다.
-- 함수형 프로그래밍은 프로그램의 속성에 대한 엄밀한 근거를 제시하기 위해 간단한 수학적 Basis를 갖고 있다.

-- 1) Functional Composition
-- f :: Y -> Z & g :: X -> Y => f.g :: X -> Z // (f.g)x = f(g(x))

(sin.cos) (pi/2)

-- -Example (Not real functions)

type Text = [Char]
type Word = [Char]
commonWords :: Int -> Word -> Text
words :: Text -> [Word]
toLower :: Char -> Char -- Capital to Lower
map :: (a -> b) -> [a] -> [b]
-- map.toLower :: Text -> Text ([Char] -> [Char])

-- -Example (Number to String - Real Code)

-- units, teens, tens :: [String] = [[Char]]

units = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
tens = ["twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"]

convert1 :: Int -> String
convert1 n = units!!n -- julia:units[n]

digits2 :: Int -> (Int, Int)
digits2 n = (n `div` 10, mod n 10)

combine2 :: (Int, Int) -> String
combine2 (t,u)
  | t==0 = units!!u
  | t==1 = teens!!u
  | 2<=t && u==0 = tens!!(t-2)
  | 2<=t && u/=0 = tens!!(t-2) ++ "-" ++ units!!u

convert2 :: Int -> String
convert2 = combine2 . digits2

convert3 :: Int -> String
convert3 n
  | h==0 = convert2 t
  | n==0 = units!!h ++ " hundred"
  | otherwise = units!!h ++ " hundred and " ++ convert2 t
  where (h,t) = (n `div` 100, n `mod` 100)

link :: Int -> String
link h = if h < 100 then " and " else " "

convert6 :: Int -> String
convert6 n
  | m==0 = convert3 h
  | h==0 = units!!h ++ " thousand"
  | otherwise = convert3 m ++ " thousand" ++ link h ++ convert3 h
  where (m,h) = (n `div` 1000, n `mod` 1000)
