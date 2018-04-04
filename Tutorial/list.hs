-- Declare Variables
-- With TMUX!
t1 = [ x ^ 2 | x <- [1 .. 3] ]
t2 = [ (x, y) | x <- [1 .. 3], y <- [4 .. 5] ]
t3 = [ x | x <- [1 .. 10], even x ] -- Guard

print t1
print t2
print t3

factors :: Int -> [Int]
factors n = [ x | x <- [1 .. n], n `mod` x == 0 ]

prime :: Int -> Bool
prime n = factors n == [1, n]

primes :: Int -> [Int]
primes n = [ x | x <- [1 .. n], prime x ]

t4 = primes 100

print t4
