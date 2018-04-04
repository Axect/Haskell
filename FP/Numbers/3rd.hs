-- # Floor

until :: (a -> Bool) -> (a -> a) -> a -> a
until p f x = if p x then x else until p f (f x)

-- until has recursion. If not (p x) then continuous mapping with f
-- Here is the example.

until (>100) (*7) 1

-- We can define floor using this until function.

-- 1. Negative

floor x = until (`leq` x) (subtract 1) (-1)
  where m `leq` x = fromInteger m <= x

-- (use `leq` because leq :: Integer -> Float -> Bool)

-- 2. Positive

floor x = until (x `lt`) (+ 1) 1 - 1 where x `lt` n = x < fromInteger n

-- 3. Together

floor x | x < 0     = until (`leq` x) (subtract 1) (-1)
        | otherwise = until (x `lt`) (+ 1) 1 - 1
 where
  m `leq` x = fromInteger m <= x
  x `lt` n = x < fromInteger n

floor 10.2

-- 4. Binary Search (More Effective)

type Interval = (Integer, Integer)

choose :: Interval -> Integer
choose (m, n) = (m + n) `div` 2

shrink :: Float -> Interval -> Interval
shrink x (m, n) = if p `leq` x then (p, n) else (m, p) where p = choose (m, n)

floor :: Float -> Integer
floor x = fst (until unit (shrink x) (bound x))
  where unit (m, n) = (m + 1 == n)

-- Natural Numbers

data Nat = Zero | Succ Nat

-- It means Zero, Succ(Zero), Succ(Succ(Zero)) ... are Natural Number


