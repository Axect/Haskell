-- Fibonacci memoization
fibMem :: Int -> Integer
fibMem = (map fib [0 ..] !!)
 where
  fib 0 = 1
  fib 1 = 1
  fib n = fibMem (n - 2) + fibMem (n - 1)
