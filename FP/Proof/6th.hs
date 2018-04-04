-- Proofs

data Nat = Zero | Succ Nat deriving (Eq, Ord, Show)

instance Num Nat where
  m + Zero   = m
  m + Succ n = Succ (m+n)
  m * Zero   = Zero
  m * Succ n = m * n + m
  abs n           = n
  signum Zero     = Zero
  signum (Succ n) = Succ Zero
  m - Zero        = m
  Zero - Succ n   = Zero
  Succ m - Succ n = m - n
  fromInteger x
    | x <= 0 = Zero
    | otherwise = Succ (fromInteger (x-1))

exp :: Num a => a -> Nat -> a
exp x Zero     = 1
exp x (Succ n) = x * exp x n -- Like Factorial

-- We want to prove exp x (m+n) = exp x m * exp x n

-- 1) Case 0

exp 3 (Succ(Succ(Succ(Zero))))

exp 3 (Succ(Succ(Zero))) * exp 3 (Succ(Zero))
