# Floor

> until :: (a -> Bool) -> (a -> a) -> a -> a
> until p f x = if p x then x else until p f (f x)

until has recursion. If not (p x) then continuous mapping with f
Here is the example.

> until (>100) (*7) 1

We can define floor using this until function.

1. Negative

> floor x = until (`leq` x) (subtract 1) (-1) where m `leq` x = fromInteger m <= x

(use `leq` because leq :: Integer -> Float -> Bool)

2. Positive

> floor x = until (x `lt`) (+1) 1 - 1 where x `lt` n = x < fromInteger n

3. Together

> floor x | x < 0 = until (`leq` x) (subtract 1) (-1) */
>         | otherwise = until (x `lt`) (+1) 1 - 1
>         where m `leq` x = fromInteger m <= x
>               x `lt` n = x < fromInteger n

> floor 10.2

# Natural Number

> data Nat = Zero | Succ Nat

(Successor n means n+1 (next to n))
It means Zero, Succ(Zero), Succ(Succ(Zero)) are Natural numbers.

> instance Eq Nat where
>   Zero   == Zero   = True
>   Zero   == Succ n = False
>   Succ m == Zero   = False
>   Succ m == Succ n = (m == n)

> instance Show Nat where
>   show Zero            = "Zero"
>   show (Succ Zero)     = "Succ Zero"
>   show (Succ (Succ n)) = "Succ (" ++ show (Succ n) ++ ")"

But this is really bothered job. Haskell support smart construction.

> data Nat = Zero | Succ Nat deriving (Eq, Ord, Show)

> instance Num Nat where
>   m + Zero   = m
>   m + Succ n = Succ (m+n)
>   
>   m * Zero     = Zero
>   m * (Succ n) = m * n + m
>
>   abs n           = n
>   signum Zero     = Zero
>   signum (Succ n) = Succ Zero
>
>   m - Zero        = m
>   Zero - Succ n   = Zero
>   Succ m - Succ n = m - n
>   
>   fromInteger x
>     | x <= 0    = Zero
>     | otherwise = Succ (fromInteger (x-1))

We chould have chosen to make the constructor Succ strict.

> data Nat = Zero | Succ !Nat

! means Strict flag.

