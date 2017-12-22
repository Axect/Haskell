module Main (main) where

main :: IO ()
main = do
    print x
    print y

add :: Int -> Int -> Int
add a b = a + b

fib :: Int -> Int
fib n | n < 0 = error "invalid index"
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

x = add 4 5
y = fib 10
