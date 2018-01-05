# List

Data Constructor for List

> data List a = Nil | Cons a (List a)

* undefined list    = undefined :: [a]
* empty list        = [] :: [a]
* list of form x:xs = x :: a & xs :: [a]
* finite list       = 1:2:3:[]
* partial list      = 1:2:3:undefined
* infinite list     = [1..]

iterate returns infinite list

> iterate :: (a -> a) -> a -> [a]
> iterate f x = x:iterate f (f x)o

> take 10 $ iterate (+1) 1

Example

> divisors :: Int -> [Int]
> divisors n = [x | x <- [1..n-1], n `mod` x == 0]

> perfect :: Int -> Bool
> perfect n = (n == sum (divisors n))

> take 3 (filter perfect [1..])

# Enumerations

* [m..n]   = [m,m+1,...,n]
* [m..]    = [m,...]
* [m,n..p] = [m,m+(n-m),m+2(n-m),...,p]
* [m,n..]  = [m,m+(n-m),...]

> [0,2..11]

> ['a'..'z']

# List Comprehensions

> [x*x | x <- [1..5]]

> [(i,j) | i <- [1..5], even i, j <- [i..5]]

> [x | xs <- [[(3,4)], [(5,4),(3,2)]], (3,x) <- xs]

> isPrime :: Int -> Bool
> isPrime n = length (divisors n) == 1

> [x | x <- [1..100], isPrime x]

> triads :: Int -> [(Int, Int, Int)]
> triads n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

> triads 15

# Functor

> class Functor f where
>   fmap :: (a -> b) -> f a -> f b

> data Tree a = Tip a | Fork (Tree a) (Tree a)

> instance Functor Tree where
>   fmap f (Tip x) = Tip (f x)
>   fmap f (Fork u v) = Fork (fmap f u) (fmap f v)

> fmap (+1) [2,3,4]
